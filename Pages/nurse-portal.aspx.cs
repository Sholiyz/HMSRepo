using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_nurse_portal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NurseListGridView.DataSource = LoadOrderItems();
        NurseListGridView.DataBind();
    }

    private List<RoleItems> LoadOrderItems()
    {
        List<RoleItems> RolesList = new List<RoleItems>()
        {
            new RoleItems
            {
               ID=1,
               Name="French Cuz",
               Price=2500,
               IsProcessing=true,
               IsCancelled=false,
               IsDelivered=false,

            },
            new RoleItems
            {
               ID=2,
               Name="Japan Cuz",
               Price=2900,
               IsProcessing=false,
               IsCancelled=false,
               IsDelivered=false
            },
            new RoleItems
            {
               ID=3,
               Name="Jollof Rice",
               Price=5000,
               IsProcessing=false,
               IsCancelled=false,
               IsDelivered=true
            },
            new RoleItems
            {
               ID=4,
               Name="Ricwa",
               Price=7500,
               IsProcessing=false,
               IsCancelled=false,
               IsDelivered=true
            },
            new RoleItems
            {
               ID=5,
               Name="RicBe",
               Price=1500,
               IsProcessing=false,
               IsCancelled=true,
               IsDelivered=false
            }
        };

        return RolesList;

    }

    public class RoleItems
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public bool IsProcessing { get; set; }
        public bool IsDelivered { get; set; }
        public bool IsCancelled { get; set; }
        private string ProcessStatus;
        public string ISProcessStatus
        {
            get { return ProcessStatus; }
            set { ProcessStatus = (IsProcessing == true) ? "Processing" : "Placed"; }
        }

        private string DeliveredStatus;

        public string IsDeliveredStatus
        {
            get { return DeliveredStatus; }
            set { DeliveredStatus = (IsDelivered == true) ? "Delivered" : "Pending"; }
        }

        private string CanclledStatus;

        public string IsCanclledStatus
        {
            get { return CanclledStatus; }
            set { CanclledStatus = (IsCancelled == true) ? "Canceled" : "Pending"; }
        }


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
        return;


    }

    protected void ShowPopAlert_Click(object sender, EventArgs e)
    {
        //Call Pop up Alert

        Alert.CallAlert(Alert.Alerttype.warming.ToString(), "Check and try again.");
        //Alert.CallAlert(Alert.Alerttype.error.ToString(), "Operation can not be done.");
        return;
    }

}