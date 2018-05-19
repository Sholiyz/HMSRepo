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
        if (!IsPostBack)
        {
            string role = Pasture.GetCurrentUserSessionRole();
            ManageRoleView("admin");
            SetDefualtView();
        }
        
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



    #region Manage Page Nav

    private void SetActiveContainerVisible(string NavtabName)
    {
        if (NavtabName.ToLower() == "user")
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
        SetActiveContainerVisible("User");
        HideUserViews();
        ViewUserListDiv.Visible = true;
        BindUserList();

    }

    private void SetDefualtView()
    {
        SetActiveContainerVisible("Usercreation");
        HideUserViews();
        ViewUserListDiv.Visible = true;
        BindUserList();
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

    #endregion

    #region Manage MenuNav
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
            SetActiveContainerVisible("adminportal");
            HideUserViews();
            ViewUserListDiv.Visible = true;
            BindUserList();
            return;
        }
        if (rolename.ToLower().Contains("nurse"))
        {
            HideAllMenuNav();
            patientsportal.Visible = true;
            nursesportal.Visible = true;
            SetActiveContainerVisible("PatientPlan");
            return;
        }
        if (rolename.ToLower().Contains("doctor"))
        {
            HideAllMenuNav();
            patientsportal.Visible = true;
            doctorsportal.Visible = true;
            SetActiveContainerVisible("PatientPlan");
            return;
        }
        else
        {
            HideAllMenuNav();
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

    #endregion

    #region Role Management
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

    #endregion

  


    #region Populate DroupDownlist
    private void PopulateRolelist(DropDownList ddlistname)
    {
        //AuthRole role = new AuthRole();        
        ddlistname.DataSource = Pasture.GetRoles();
        ddlistname.DataTextField = "RoleName";
        ddlistname.DataValueField = "RoleID";     
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Role...", "NA"));
    }
    private void PopulateEmployeelist(DropDownList ddlistname)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetEmployeeList();
        ddlistname.DataTextField = "FullName";
        ddlistname.DataValueField = "EmployeeID";        
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Employee...", "NA"));
    }
    #endregion



    #region Bindings

    private void BindUserList()
    {
        UserListGridView.DataSource = Pasture.GetUsers();
        UserListGridView.DataBind();
    }

    private void BindRoleList()
    {
        RoleListGrid.DataSource = Pasture.GetRoles();
        RoleListGrid.DataBind();
    }

    #endregion

    #region Response Message
    private void ShowSxsResponse(string message)
    {
        ResponseAlert.NewMessage = message;
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.success.ToString();//"Success";
        ResponseAlert.NoteVisible = true;
        ResponseAlert.ShowNotification();
        return;
    }

    private void ShowErrorResponse(string message)
    {
        ResponseAlert.NewMessage = message;
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.error.ToString();//"Success";
        ResponseAlert.NoteVisible = true;
        ResponseAlert.ShowNotification();
        return;
    }
    private void ShowWarningResponse(string message)
    {
        ResponseAlert.NewMessage = message;
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.warning.ToString();//"Success";
        ResponseAlert.NoteVisible = true;
        ResponseAlert.ShowNotification();
        return;
    }
    private void ShowInfoResponse(string message)
    {
        ResponseAlert.NewMessage = message;
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.info.ToString();//"Success";
        ResponseAlert.NoteVisible = true;
        ResponseAlert.ShowNotification();
        return;
    }
    #endregion


    #region User Section

    protected void ViewUserlistAddUserButton_Click(object sender, EventArgs e)
    {
        HideUserViews();
        AddUserDiv.Visible = true;
        PopulateRolelist(Adduserrolelistddl);
        PopulateEmployeelist(AddUserEmployeelistddl);
    }
    protected void ViewUserBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideUserViews();
            ViewUserListDiv.Visible = true;
            BindUserList();

        }
        catch (Exception)
        {

            throw;
        }

    }

    protected void AddUserBackBtn_Click(object sender, EventArgs e)
    {

        try
        {
            HideUserViews();
            ViewUserListDiv.Visible = true;
            BindUserList();

        }
        catch (Exception)
        {

            throw;
        }

    }

    protected void AddUserSubmitBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (AddUserEmployeelistddl.SelectedValue.ToString() == "NA")
            {
                ShowErrorResponse("Employee Not Selected!!");
                return;
            }

            if (Adduserrolelistddl.SelectedValue.ToString() == "NA")
            {
                ShowErrorResponse("User Role Not Selected!!");
                return;
            }
            if (AddUserPasswordTxtBox.Text == AddUserConfirmPasswordTxtBox.Text)
            {
                ShowErrorResponse("Password Not match!!");
                return;
            }

            AuthUser newUser = new AuthUser
            {

                //UserName = AddUsernameTxtBox.Text,
                Password = AddUserPasswordTxtBox.Text,
                StaffRoleID = Convert.ToInt32(Adduserrolelistddl.SelectedValue.ToString()),
                StaffID = Convert.ToInt32(AddUserEmployeelistddl.SelectedValue.ToString())

            };

            int response = Pasture.AddNewUser(newUser);
            if (response > 0)
            {
                PopulateRolelist(Adduserrolelistddl);
                PopulateEmployeelist(AddUserEmployeelistddl);
                //ShowSxsResponse("User Successfly Added!!");
                PastureAlert.PopSuccessAlert("User account successfly created!!");
            }
            else
            {
                ShowErrorResponse("User account not created kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("User acount Not created Kindly Contact admin.");
            //throw;
        }
    }

    protected void ViewUserBtn_Click(object sender, EventArgs e)
    {

        try
        {
            Button btn = (Button)sender;
            int userid = Convert.ToInt32((btn.CommandArgument.ToString()));
            AuthUser viewUser = Pasture.GetUserByID(userid);
            ViewUserEmployeeNameTextField.Text = Pasture.GetEmployeeFullNameById(viewUser.StaffID);
            ViewUserUserNameTextField.Text = viewUser.UserName;
            ViewUserRoleTextField.Text = Pasture.GetRoleNameByRoleID(viewUser.StaffRoleID);
            HideUserViews();
            ViewUserCreationDiv.Visible = true;



        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void EditUserBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideUserViews();
            ViewUserListDiv.Visible = true;
            BindUserList();

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void EditUserProceedButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (EditUserUserRoleddl.SelectedValue.ToString() == "NA")
            {
                ShowErrorResponse("User Role Not Selected!!");
                return;
            }
            if (!(EditUserPasswordTextbox.Text == EditUserConfirmPasswordTextbox.Text))
            {
                ShowErrorResponse("Password Not match!!");
                return;
            }

            AuthUser newUser = new AuthUser
            {

                //UserName = AddUsernameTxtBox.Text,
                Password = AddUserPasswordTxtBox.Text,
                StaffRoleID = Convert.ToInt32(Adduserrolelistddl.SelectedValue.ToString()),
                StaffID = Convert.ToInt32(AddUserEmployeelistddl.SelectedValue.ToString())

            };

            int response = Pasture.UpdateUser(newUser);
            if (response > 0)
            {
                PopulateRolelist(Adduserrolelistddl);
                //ShowSxsResponse("User Successfly Added!!");
                PastureAlert.PopSuccessAlert("User account successfly updated!!");
            }
            else
            {
                ShowErrorResponse("User Account not updated kindly try again!!");
            }
        }
        catch (Exception)
        {

            throw;
        }
        
    }

    protected void EditUserBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int userid = Convert.ToInt32((btn.CommandArgument.ToString()));
            PopulateRolelist(EditUserUserRoleddl);
            AuthUser viewUser = Pasture.GetUserByID(userid);
            EditUserEmployeeNameTextBox.Text = Pasture.GetEmployeeFullNameById(viewUser.StaffID);
            EditUserUsername.Text = viewUser.UserName;
            EditUserUserRoleddl.SelectedValue = viewUser.StaffRoleID.ToString();

            HideUserViews();
            EditUserDiv.Visible = true;



        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void DeleteUserBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int userid = Convert.ToInt32((btn.CommandArgument.ToString()));
            int response = Pasture.DeleteUserByID(userid);
            if (response > 0)
            {
               PastureAlert.PopSuccessAlert("User Successfly Deleted!!");
                
                try
                {
                    HideUserViews();
                    ViewUserListDiv.Visible = true;
                    BindUserList();

                }
                catch (Exception)
                {

                    throw;
                }
            }
            else
            {
                ShowErrorResponse("Operation Failed Kindly try agian");
            }

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void UserActivatioButton_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int userid = Convert.ToInt32((btn.CommandArgument.ToString()));
            bool ActivateState;
            int response = Pasture.ActivateOrDeactivateUser(userid,out ActivateState);

            if (response > 0)
            {
                if (ActivateState)
                {
                    PastureAlert.PopSuccessAlert("User Successfly Activated!!");
                }
                else
                {
                    PastureAlert.PopSuccessAlert("User Successfly Deactivated!!");
                }
                try
                {
                    HideUserViews();
                    ViewUserListDiv.Visible = true;
                    BindUserList();

                }
                catch (Exception)
                {

                    throw;
                }
            }
            else
            {
                ShowErrorResponse("Operation Failed Kindly try agian");
            }



        }
        catch (Exception)
        {

            throw;
        }
    }

    private void HideUserViews()
    {
        AddUserDiv.Visible = false;
        ViewUserListDiv.Visible = false;
        ViewUserCreationDiv.Visible = false;
        EditUserDiv.Visible = false;
    }
    #endregion




  
}