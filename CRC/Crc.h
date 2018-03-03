//---------------------------------------------------------------------------

#ifndef CrcH
#define CrcH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <Grids.hpp>
#include "LMDBaseControl.hpp"
#include "LMDBaseGraphicControl.hpp"
#include "LMDControl.hpp"
#include "LMDGraphicControl.hpp"
#include "LMDLEDCustomLabel.hpp"
#include "LMDLEDLabel.hpp"
#include <ExtCtrls.hpp>
#include "LMDAboutDlg.hpp"
#include "LMDBaseDialog.hpp"
#include "LMDContainerComponent.hpp"
#include "LMDCustomComponent.hpp"
#include <ImgList.hpp>
#include <Menus.hpp>
#include "lmdmsg.hpp"
#include "LMDTimer.hpp"
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TCRCFrm : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel2;
    TLMDLEDLabel *MainLed;
    TLMDAboutDlg *AboutBox;
    TMainMenu *MainMenu1;
    TMenuItem *File1;
    TMenuItem *eXit1;
    TMenuItem *Help1;
    TMenuItem *About2;
    TLMDMessageBoxDlg *MB1;
    TLMDHiTimer *HiTimer;
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TTabSheet *TabSheet2;
    TPanel *Panel1;
    TLabel *Label1;
    TLabel *Label7;
    TLMDLEDLabel *CRCLED;
    TLMDLEDLabel *CRCLedLbl;
    TEdit *Edit1;
    TEdit *Edit2;
    TEdit *Edit3;
    TEdit *Edit4;
    TBitBtn *ClearCRCBtn;
    TPanel *Panel3;
    TLMDLEDLabel *CSumLED;
    TLMDLEDLabel *CSumLedLbl;
    TBitBtn *ClearCSumBtn;
    TMemo *Memo1;
    TPanel *Panel4;
    TBitBtn *CalcCRCBtn;
    TBitBtn *CloseBtn;
    TLabel *Label2;
    TCheckBox *NotCbx;
    TLabel *Label3;
    void __fastcall CalcCRCBtnClick(TObject *Sender);
    void __fastcall ClearCRCBtnClick(TObject *Sender);
    void __fastcall eXit1Click(TObject *Sender);
    void __fastcall About2Click(TObject *Sender);
    void __fastcall HiTimerTimer(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall ClearCSumBtnClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TCRCFrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCRCFrm *CRCFrm;
//---------------------------------------------------------------------------
#endif
