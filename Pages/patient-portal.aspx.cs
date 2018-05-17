using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_patient_portal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UpdateDisplayPannel();
    }

    public string GetIsProcessStatus(bool value)
    {
        return (value == true) ? "Processing" : "Placed";
    }
    public string GetIsDeliveredStatus(bool value)
    {
        return (value == true) ? "Delivered" : "Pending"; ;
    }
    public string GetIsCancelledStatus(bool value)
    {
        return (value == true) ? "Cancelled" : "Not-Cancelled";
    }

    protected void ShowAlertClick_Click(object sender, EventArgs e)
    {

        //Response Alert Call Method

        ResponseAlert.NewMessage = "Show Alert Notification!";
        ResponseAlert.NoteType = "Success";
        ResponseAlert.NoteVisible = true;


        ResponseAlert.ShowNotification();
        //return;


    }

    protected void ShowPopAlert_Click(object sender, EventArgs e)
    {
        UpdateDisplayPannel();
        //Call Pop up Alert

        Alert.CallAlert(Alert.Alerttype.warning.ToString(), "Check and try again.");
        
        //Alert.CallAlert(Alert.Alerttype.error.ToString(), "Operation can not be done.");
        //return;
    }

    private void UpdateDisplayPannel()
    {
        selected_tab.Value = Request.Form[selected_tab.UniqueID];

    }
}