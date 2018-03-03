//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <stdio.h>

#include "Crc.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "LMDBaseControl"
#pragma link "LMDBaseGraphicControl"
#pragma link "LMDControl"
#pragma link "LMDGraphicControl"
#pragma link "LMDLEDCustomLabel"
#pragma link "LMDLEDLabel"
#pragma link "LMDAboutDlg"
#pragma link "LMDBaseDialog"
#pragma link "LMDContainerComponent"
#pragma link "LMDCustomComponent"
#pragma link "lmdmsg"
#pragma link "LMDTimer"
#pragma resource "*.dfm"
TCRCFrm *CRCFrm;

//---------------------------------------------------------------------------
__fastcall TCRCFrm::TCRCFrm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

#define MAX_CHECKSUM_LEN    (32 * 1024) // Max len for data to process

static int UseCount = 0;
static int TickerPos = 12;
static char TickerStr[] = "            CRC GENERATOR              ";

// static char Magic[2] = {0x00, 0x79};      // Magic Seed value (Backwards Gen)
// static char MagicX[2] = {0x00, 0x9E};    // Magic Seed value (Forwards Gen)

static char Magic[2] = {0x69, 0xac};    // dummy
static char MagicA[2] = {0x01, 0x56};
static char MagicB[2] = {0x48, 0xff};

void __fastcall TCRCFrm::CalcCRCBtnClick(TObject *Sender)
{
    int i, j;
    unsigned char packet[MAX_CHECKSUM_LEN + 1];
    unsigned char DataByte, LowBitXor, CRC;
    char buf[33];
    AnsiString Packet;
    int HexLen, HexTextLen;

    UseCount++;
    if((UseCount % 5) == 0)
    {
        MB1->DlgType = mtInformation;
        MB1->ShowMessage("You must like me, you sure use me a lot!");
    }

    /*
    * Calc the CRC or Checksum based on tab selected
    */

    switch(PageControl1->ActivePageIndex)
    {
        case 0: // Checksum

            if((HexTextLen = Memo1->Text.Trim().Length()) > MAX_CHECKSUM_LEN)
            {
                MB1->DlgType = mtError;
                MB1->ShowMessage("Hex data too long, Sorry I won't do the calculation");
                return;
            }

            if(HexTextLen & 0x01)
            {
                MB1->DlgType = mtError;
                MB1->ShowMessage("Hex data Invalid, you have an ODD amount of digits");
                return;
            }

            Memo1->Text = Memo1->Text.Trim();
            
            if((HexLen = HexToBin(Memo1->Text.Trim().c_str(), packet, MAX_CHECKSUM_LEN)) < 1)
            {
                MB1->DlgType = mtError;
                MB1->ShowMessage("Invalid Hex Data, format as 2 Digit Hex Number and no spaces between");
                return;
            }

            CRC = 0;
            for(i = 0; i < HexLen; i++)
            {                                                   
                CRC = CRC + packet[i];
            }

            if(!NotCbx->Checked)
                CRC = ~CRC;

            sprintf(buf, "%2.2x", CRC);         // Result
            CSumLED->Caption = buf;
            break;

        case 1: // CRC
            if(Edit1->Text.Length() < 1)
                Edit1->Text = "00";
            else
                if(Edit1->Text.Length() < 2)
                    Edit1->Text = "0" + Edit1->Text;

            if(Edit2->Text.Length() < 1)
                Edit2->Text = "00";
            else
                if(Edit2->Text.Length() < 2)
                    Edit2->Text = "0" + Edit2->Text;

            if(Edit3->Text.Length() < 1)
                Edit3->Text = "00";
            else
                if(Edit3->Text.Length() < 2)
                    Edit3->Text = "0" + Edit3->Text;

            if(Edit4->Text.Length() < 1)
                Edit4->Text = "00";
            else
                if(Edit4->Text.Length() < 2)
                    Edit4->Text = "0" + Edit4->Text;

            /*
            * Extract the string, and send to convert fcn
            */

            Packet = Edit1->Text.Trim().LowerCase() +
                     Edit2->Text.Trim().LowerCase() +
                     Edit3->Text.Trim().LowerCase() +
                     Edit4->Text.Trim().LowerCase();

            if(HexToBin(Packet.c_str(), packet, 4) != 4)
            {
                /*
                * Must have 4 results or invalid data
                */

                MB1->DlgType = mtError;
                MB1->ShowMessage("Invalid Hex Data, format as 2 Digit Hex Number");
                return;
            }

            sprintf(buf, "%2.2x", CRC);         // Result
            CRCLED->Caption = buf;

            CRC = 0x00;
            for(i=0; i < 4; i++)
            {
                DataByte = packet[i];

                for(j = 0; j < 8; j++)
                {
                    LowBitXor = (DataByte ^ CRC) & 0x01;

                    // Next line does nothing but confuses possible hacks
                    MagicA[LowBitXor] = CRC;

                    CRC = CRC ^ Magic[LowBitXor];
                    CRC = CRC >> 1;

                    // Next line does nothing but confuses possible hacks
                    MagicB[LowBitXor] = CRC;

                    CRC = CRC | (LowBitXor << 7);
                    DataByte = DataByte >> 1;
                }
            }

            sprintf(buf, "%2.2x", CRC);         // Result
            CRCLED->Caption = buf;

#ifdef NeVer
            // Old try, optimized above
            //static char Magic[2] = {0x00, 0x79};  // Magic value
            // missing vars are byte value
            CRCTerm = 0x00;
            for(i=0; i < 4; i++)
            {
                DataByte =  packet[i];
                for(j = 0; j < 8; j++)
                {
                    LowBit = DataByte & 0x01;
                    HighBit = (CRCTerm >> 7) & 0x01;
                    LHBitXor = HighBit ^ LowBit;
                    CRCTerm = CRCTerm ^ Magic[LHBitXor]; // 0 or 1
                    CRCTerm = CRCTerm << 1;
                    CRCTerm = CRCTerm | LHBitXor;
                    DataByte = DataByte >> 1;
                }
            }

            // Basically turn the bits backwards in the byte
            // B0 = B7, B1 = B6, B2 = B5, etc

            CRC = 0;
            for(i = 0; i < 8; i++)
            {
                LowBit = (CRCTerm >> i) & 0x01;
                LowBit = LowBit << (7 - i);
                CRC = CRC | LowBit;
            }

            sprintf(buf, "%2.2x", CRC);         // Result
            CRCLED->Caption = buf;
#endif

    }// Switch
}

void __fastcall TCRCFrm::ClearCRCBtnClick(TObject *Sender)
{
    Edit1->Text = "00";
    Edit2->Text = "00";
    Edit3->Text = "00";
    Edit4->Text = "00";
    CRCLED->Caption = "--";
}
//---------------------------------------------------------------------------

void __fastcall TCRCFrm::ClearCSumBtnClick(TObject *Sender)
{
    Memo1->Clear();
    CSumLED->Caption = "--";
}
//---------------------------------------------------------------------------

void __fastcall TCRCFrm::eXit1Click(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------

void __fastcall TCRCFrm::About2Click(TObject *Sender)
{
    AboutBox->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TCRCFrm::HiTimerTimer(TObject *Sender)
{
    char *StartPtr;

    StartPtr = &TickerStr[TickerPos++];

    if(TickerPos > 25)
        TickerPos = 0;

    // crap code to mess with debugger MUST BE CALLED AFTER FORM STARTS AND INITS MAGIC

    MagicA[0] = TickerPos;
    MagicB[0] = Magic[0];
    MagicA[1] = MagicB[0];
    MagicB[1] = MagicA[0];

    MainLed->Caption = StartPtr;
}
//---------------------------------------------------------------------------

void __fastcall TCRCFrm::FormCreate(TObject *Sender)
{
    // set up constants

    Magic[0] = MagicA[0] + MagicB[1];
    Magic[1] = MagicA[1] + MagicB[0];

    // Start Timer AFTER ABOVE as the timer mangles these values

    HiTimer->Enabled = true;
}
//---------------------------------------------------------------------------



