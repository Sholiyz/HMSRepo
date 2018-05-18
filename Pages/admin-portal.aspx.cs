using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_admin_portal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string role = Pasture.GetCurrentUserSessionRole();

        ManageRoleView("adin");


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
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.info.ToString() ;//"Success";
        ResponseAlert.NoteVisible = true;
        
       
        ResponseAlert.ShowNotification();
        return;


    }

    private void SetActiveView()
    {

    }





    protected void ShowPopAlert_Click(object sender, EventArgs e)
    {
        //Call Pop up Alert

        Alert.CallAlert(Alert.Alerttype.success.ToString(), "Check and try again.");
        //Alert.CallAlert(Alert.Alerttype.error.ToString(), "Operation can not be done.");
        return;
    }

    private void SetActiveContainerVisible(string NavtabName)
    {
        if (NavtabName.ToLower()=="user")
        {
            HideContentView();
            usercreationli.Attributes["class"] = "active";
            usercreation.Visible = true;
            usercreation.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "role")
        {
            HideContentView();
            roleli.Attributes["class"] = "active";
            role.Visible = true;
            role.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "transactiontype")
        {
            HideContentView();
            transactiontypeli.Attributes["class"] = "active";
            transactiontype.Visible = true;
            transactiontype.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "patientplan")
        {
            HideContentView();
            patientplanli.Attributes["class"] = "active";
            patientplan.Visible = true;
            patientplan.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "dutytype")
        {
            HideContentView();
            dutytypeli.Attributes["class"] = "active";
            dutytype.Visible = true;
            dutytype.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "assigningnurseduty")
        {
            HideContentView();
            assigningnursedutyli.Attributes["class"] = "active";
            assigningnurseduty.Visible = true;
            assigningnurseduty.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        //if (NavtabName.ToLower() == "role")
        //{
        //    HideContentView();
        //    assigningnursedutyli.Attributes["class"] = "active";
        //    assigningnurseduty.Visible = true;
        //}



       

        
    }

    private void HideContentView()
    {
        usercreation.Visible = false;
        usercreationli.Attributes["class"] = "";
        transactiontype.Visible = false;
        transactiontypeli.Attributes["class"] = "";
        role.Visible = false;
        roleli.Attributes["class"] = "";
        dutytype.Visible = false;
        dutytypeli.Attributes["class"] = "";
        patientplan.Visible = false;
        patientplanli.Attributes["class"] = "";
        assigningnurseduty.Visible = false;
        assigningnursedutyli.Attributes["class"] = "";
    }


    protected void UsercreationDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("Usercreation");
        PopulateRolelist(Adduserrolelistddl);

    }

    protected void TransactionTypeDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("TransactionType");
    }

    protected void RoleDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("Role");
        RoleListGrid.DataSource = LoadOrderItems();
        RoleListGrid.DataBind();
    }

    protected void PatientPlanDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("PatientPlan");
    }

    protected void DutyTypeDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("DutyType");
    }

    protected void AssigningNurseDutyDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("AssigningNurseDuty");
    }

    private void ManageRoleView(string rolename)
    {
        
        //string role = "edmin"; //Pasture.GetCurrentUserSessionRole();


        if (rolename.ToLower() == "admin")
        {
            dashboard.Visible = true;
            patientsportal.Visible = true;
            nursesportal.Visible = true;
            doctorsportal.Visible = true;
            adminportal.Visible = true;
            return;
        }
        if (rolename.ToLower().Contains( "nurse"))
        {
            HideAllMenuNav();           
            patientsportal.Visible = true;
            nursesportal.Visible = true;           
            return;
        }
        if (rolename.ToLower().Contains("doctor"))
        {
            HideAllMenuNav();            
            patientsportal.Visible = true;            
            doctorsportal.Visible = true;
            return;
        }
    }

    private void HideAllMenuNav()
    {
        dashboard.Visible = false;
        patientsportal.Visible = false;
        nursesportal.Visible = false;
        doctorsportal.Visible = false;
        adminportal.Visible = false;
    }

    protected void AddRoleProceedButton_Click(object sender, EventArgs e)
    {
        AuthRole newRole = new AuthRole()
        {
            RoleName = RoleNameTxtbox.Text,
            RoleDescription=RoleDescriptionTxtbox.Text
            
        };

        Pasture.AddNewRole(newRole);
       
    }

    protected void AddRoleBackButton_Click(object sender, EventArgs e)
    {

    }

    protected void AddUserBackBtn_Click(object sender, EventArgs e)
    {
        AuthUser newUser = new AuthUser
        {
            UserName=AddUsernameTxtBox.Text,
            Password=AddUserPasswordTxtBox.Text,
            StaffRoleID=Convert.ToInt32(Adduserrolelistddl.SelectedValue.ToString())

        };
    }

    protected void AddUserSubmitBtn_Click(object sender, EventArgs e)
    {

    }


    private void PopulateRolelist(DropDownList ddlistname)
    {
        AuthRole role = new AuthRole();        
        ddlistname.DataSource = Pasture.GetRoles();
        ddlistname.DataTextField = "RoleName";
        ddlistname.DataValueField = "RoleID";
        ddlistname.DataBind();
    }

    private void PopulateEmployeelist(DropDownList ddlistname)
    {
        Employee role = new Employee();

        
        ddlistname.DataSource = Pasture.GetRoles();
        ddlistname.DataTextField = "RoleName";
        ddlistname.DataValueField = "RoleID";
        ddlistname.DataBind();
    }
}