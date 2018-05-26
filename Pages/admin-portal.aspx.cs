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
        //if (!IsPostBack)
        //{
        if (!IsPostBack)
        {
            string role = Pasture.GetCurrentUserSessionRole();
            if (role != null)
            {
                ManageRoleView(role);
                SetDefualtView();
            }
            else
            {
                Response.Redirect("./login.aspx");
                return;
            }
        }
        //}

    }
    protected void ShowAlertClick_Click(object sender, EventArgs e)
    {

        //Response Alert Call Method

        ResponseAlert.NewMessage = "Show Alert Notification!";
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.info.ToString();//"Success";
        ResponseAlert.NoteVisible = true;


        ResponseAlert.ShowNotification();
        return;


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
        if (NavtabName.ToLower() == "attendancelog")
        {
            HideContentView();
            attendancelogli.Attributes["class"] = "active";
            attendancelog.Visible = true;
            attendancelog.Attributes["class"] = "tab-pane fade active in";
        }
        if (NavtabName.ToLower() == "hospitaldetail")
        {
            HideContentView();
            hospitaldetailli.Attributes["class"] = "active";
            hospitaldetail.Visible = true;
            hospitaldetail.Attributes["class"] = "tab-pane fade active in";
        }

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

        attendancelogli.Attributes["class"] = "";
        attendancelog.Visible = false;

        hospitaldetailli.Attributes["class"] = "";
        hospitaldetail.Visible = false;

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
        HideTranxTypeViews();
        ViewTransactionTypeListDiv.Visible = true;
        BindTranxTypeList();
    }
    protected void RoleDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("Role");
        HideRoleViews();
        ViewRolesListDiv.Visible = true;
        BindRoleList();
    }
    protected void PatientPlanDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("PatientPlan");
        HidePatientPlanViews();
        ViewPatientPlanListDiv.Visible = true;
        BindPatientPlanList();
    }
    protected void DutyTypeDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("DutyType");
        HideDutyTypeViews();
        ViewDutyTypeListDiv.Visible = true;
        BindDutyTyepList();
    }
    protected void AssigningNurseDutyDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("AssigningNurseDuty");
        HideNurseDutyViews();
        ViewNurseDutyListDiv.Visible = true;
        BindAssignedNurseDutyList();
    }
    protected void AttendanceLogDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("AttendanceLog");
        ViewAttendanceLogListDiv.Visible = true;
        BindAttendanceLogList();
        PopulateEmployeelist(AttendanceSearchEmployeeNameddl);
    }
    protected void HospitalDetailDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("HospitalDetail");
        HospitalInfo HospitalInfo = Pasture.GetHospitalInfo();
        HideHospitalDetailDivs();
        if (HospitalInfo != null)
        {
            //Load Hospital Info 
            LoadHospitalDetail();
            ViewHospitalDetailDiv.Visible = true;
        }
        else
        {
            AddHospitalDetailDiv.Visible = true;
        }

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

    #region Populate DroupDownlist

    private void PopulateRolelist(DropDownList ddlistname)
    {
        //AuthRole role = new AuthRole();        
        ddlistname.DataSource = Pasture.GetRoles();
        ddlistname.DataTextField = "RoleName";
        ddlistname.DataValueField = "RoleID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Role...", "-1"));
    }
    private void PopulateEmployeelist(DropDownList ddlistname)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetEmployeeList();
        ddlistname.DataTextField = "FullName";
        ddlistname.DataValueField = "EmployeeID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Employee...", "-1"));
    }
    private void PopulateNurselist(DropDownList ddlistname)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetNursesList();
        ddlistname.DataTextField = "FullName";
        ddlistname.DataValueField = "EmployeeID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Nurse...", "-1"));
    }
    private void PopulateDoctorlist(DropDownList ddlistname)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetNursesList();
        ddlistname.DataTextField = "FullName";
        ddlistname.DataValueField = "EmployeeID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Doctor...", "-1"));
    }
    private void PopulateDutyTypelist(DropDownList ddlistname)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetDutyTypes();
        ddlistname.DataTextField = "DutyTypeName";
        ddlistname.DataValueField = "DutyTypeID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select DutyType...", "-1"));
    }
    #endregion

    #region Bindings

    private void BindUserList()
    {
        PopulateEmployeelist(UserSearchEmployeeNameddl);
        UserListGridView.DataSource = Pasture.GetUsers();
        UserListGridView.DataBind();
    }

    private void BindRoleList()
    {
        RoleListGrid.DataSource = Pasture.GetRoles();
        RoleListGrid.DataBind();
    }

    private void BindTranxTypeList()
    {
        transactiontypeListGridView.DataSource = Pasture.GetTransactionTypes();
        transactiontypeListGridView.DataBind();
    }

    private void BindDutyTyepList()
    {
        DutyTypeListGridView.DataSource = Pasture.GetDutyTypes();
        DutyTypeListGridView.DataBind();
    }

    private void BindPatientPlanList()
    {
        PatientPlanListGridView.DataSource = Pasture.GetPatientPlans();
        PatientPlanListGridView.DataBind();
    }

    private void BindAssignedNurseDutyList()
    {
        NurseDutyListGridView.DataSource = Pasture.GetAssignNurseDutys();
        NurseDutyListGridView.DataBind();
    }

    private void BindAttendanceLogList()
    {
        AttendanceLogListGridView.DataSource = Pasture.GetAttendanceLogList();
        AttendanceLogListGridView.DataBind();
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
            if (AddUserEmployeelistddl.SelectedValue.ToString() == "-1")
            {
                ShowErrorResponse("Employee Not Selected!!");
                return;
            }

            if (Adduserrolelistddl.SelectedValue.ToString() == "-1")
            {
                ShowErrorResponse("User Role Not Selected!!");
                return;
            }
            if (AddUserPasswordTxtBox.Text != AddUserConfirmPasswordTxtBox.Text)
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
            if (EditUserUserRoleddl.SelectedValue.ToString() == "-1")
            {
                ShowErrorResponse("User Role Not Selected!!");
                return;
            }
            if (!(EditUserPasswordTextbox.Text == EditUserConfirmPasswordTextbox.Text))
            {
                ShowErrorResponse("Password Not match!!");
                return;
            }

            AuthUser updateUser = new AuthUser
            {

                //UserName = AddUsernameTxtBox.Text,
                UserID = (int)Session["CurrentEditUserID"],
                Password = EditUserPasswordTextbox.Text,
                StaffRoleID = Convert.ToInt32(EditUserUserRoleddl.SelectedValue.ToString()),
                //StaffID = Convert.ToInt32(AddUserEmployeelistddl.SelectedValue.ToString())

            };

            int response = Pasture.UpdateUser(updateUser);
            if (response > 0)
            {
                //PopulateRolelist(Adduserrolelistddl);
                //ShowSxsResponse("User Successfly Added!!");
                Session["CurrentEditUserID"] = null;
                PastureAlert.PopSuccessAlert("User account successfly updated!!");
            }
            else
            {
                ShowErrorResponse("User Account not updated kindly try again!!");
            }
        }
        catch (Exception)
        {

            ShowErrorResponse("User Account not updated kindly try again!!");
        }

    }
    protected void EditUserBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int userid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Session["CurrentEditUserID"] = userid;
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
            int response = Pasture.ActivateOrDeactivateUser(userid, out ActivateState);

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

    #region TranxType

    private void ClearTranxField()
    {
        AddTranxTypeTextBox.Text = string.Empty;
        AddTranxTypeDescriptionTextBox.Text = string.Empty;
        EditTranxTypeTextbox.Text = string.Empty;
        EditTranxTypeDescriptionTextBox.Text = string.Empty;
    }
    protected void AddTranxBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideTranxTypeViews();
            ViewTransactionTypeListDiv.Visible = true;
            BindTranxTypeList();
        }
        catch (Exception)
        {

            throw;
        }

    }
    protected void AddTranxProceedButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (AddTranxTypeTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Transaction type name field is blank!!");
                return;
            }
            if (AddTranxTypeDescriptionTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Transaction type description field is blank!!");
                return;
            }

            TransactionType newTransactionType = new TransactionType
            {

                TransactionTypeName = AddTranxTypeTextBox.Text,
                Description = AddTranxTypeDescriptionTextBox.Text

            };

            int response = Pasture.AddNewTransactionType(newTransactionType);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Transaction type successfly created!!");
                ClearTranxField();

            }
            else
            {
                ShowErrorResponse("Transaction type not created kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Transaction type Not created Kindly Contact admin.");
            //throw;
        }
    }
    protected void ViewListAddtranxbutton_Click(object sender, EventArgs e)
    {
        HideTranxTypeViews();
        AddTransactionTypeDiv.Visible = true;
    }
    protected void ViewTranxTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int tranxtypeid = Convert.ToInt32((btn.CommandArgument.ToString()));
            TransactionType viewtranxtype = Pasture.GetTransactionTypeByID(tranxtypeid);
            ViewTranxtypeTextBox.Text = viewtranxtype.TransactionTypeName;
            ViewTranxTypeDescriptionTextBox.Text = viewtranxtype.Description;
            HideTranxTypeViews();
            ViewTransactionTypeDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditTranxTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int tranxtypeid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Session["CurrentTranxtypeID"] = tranxtypeid;
            TransactionType edittranxtype = Pasture.GetTransactionTypeByID(tranxtypeid);
            EditTranxTypeTextbox.Text = edittranxtype.TransactionTypeName;
            EditTranxTypeDescriptionTextBox.Text = edittranxtype.Description;
            HideTranxTypeViews();
            EditTransactionTypeDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void DeleteTranxTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int tranxtypeid = Convert.ToInt32((btn.CommandArgument.ToString()));
            int response = Pasture.DeleteTransactionTypeByID(tranxtypeid);
            if (response > 0)
            {
                PastureAlert.PopSuccessAlert("Transaction type successfly Deleted!!");

                try
                {
                    HideTranxTypeViews();
                    BindTranxTypeList();
                    ViewTransactionTypeListDiv.Visible = true;

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
    protected void ViewTranxBackbutton_Click(object sender, EventArgs e)
    {
        try
        {
            HideTranxTypeViews();
            ViewTransactionTypeListDiv.Visible = true;
            BindTranxTypeList();
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditTranxBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideTranxTypeViews();
            ViewTransactionTypeListDiv.Visible = true;
            BindTranxTypeList();
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditTranxUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (EditTranxTypeTextbox.Text == string.Empty)
            {
                ShowErrorResponse("Transaction type name field is blank!!");
                return;
            }
            if (EditTranxTypeDescriptionTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Transaction type description field is blank!!");
                return;
            }

            TransactionType newTransactionType = new TransactionType
            {
                TransactionTypeID = (int)Session["CurrentTranxtypeID"],
                TransactionTypeName = EditTranxTypeTextbox.Text,
                Description = EditTranxTypeDescriptionTextBox.Text

            };

            int response = Pasture.UpdateTransactionType(newTransactionType);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Transaction type successfly updated!!");
                ClearTranxField();
            }
            else
            {
                ShowErrorResponse("Transaction type not updated kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Transaction type Not updated Kindly Contact admin.");
            //throw;
        }
    }
    private void HideTranxTypeViews()
    {
        AddTransactionTypeDiv.Visible = false;
        ViewTransactionTypeListDiv.Visible = false;
        EditTransactionTypeDiv.Visible = false;
        ViewTransactionTypeDiv.Visible = false;
    }

    #endregion

    #region Role Management
    private void Clearrolefields()
    {
        AddRoleNameTxtbox.Text = string.Empty;
        AddRoleDescriptionTxtbox.Text = string.Empty;
        EditRoleNameTextBox.Text = string.Empty;
        EditRoleDescriptionTextBox.Text = string.Empty;
    }
    protected void AddRoleProceedButton_Click(object sender, EventArgs e)
    {

        try
        {

            if (AddRoleNameTxtbox.Text == string.Empty)
            {
                ShowErrorResponse("Role name field is blank!!");
                return;
            }
            if (AddRoleDescriptionTxtbox.Text == string.Empty)
            {
                ShowErrorResponse("Role description field is blank!!");
                return;
            }

            AuthRole newRole = new AuthRole()
            {
                RoleName = AddRoleNameTxtbox.Text,
                RoleDescription = AddRoleDescriptionTxtbox.Text

            };


            int response = Pasture.AddNewRole(newRole);
            if (response > 0)
            {
                Clearrolefields();
                PastureAlert.PopSuccessAlert("Role successfly created!!");
            }
            else
            {
                ShowErrorResponse("Role not created kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Role type Not created Kindly Contact admin.");
            //throw;
        }
    }
    protected void AddRoleBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideRoleViews();
            ViewRolesListDiv.Visible = true;
            BindRoleList();
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void ViewRolelistAddnewButton_Click(object sender, EventArgs e)
    {
        HideRoleViews();
        AddRolesDiv.Visible = true;
    }
    protected void ViewRoleBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int roleid = Convert.ToInt32((btn.CommandArgument.ToString()));
            //Session["CurrentEditRoleID"] = roleid;
            AuthRole role = Pasture.GetRoleByID(roleid);
            ViewRoleNameTextBox.Text = role.RoleName;
            ViewRoleDecriptionTextBox.Text = role.RoleDescription;
            HideRoleViews();
            ViewRoleDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditRoleBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int roleid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Session["CurrentEditRoleID"] = roleid;
            AuthRole role = Pasture.GetRoleByID(roleid);
            EditRoleNameTextBox.Text = role.RoleName;
            EditRoleDescriptionTextBox.Text = role.RoleDescription;
            HideRoleViews();
            EditRoleDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void DeleteRoleBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int roleid = Convert.ToInt32((btn.CommandArgument.ToString()));

            int response = Pasture.DeleteRoleByID(roleid);
            if (response > 0)
            {
                PastureAlert.PopSuccessAlert("Role successfly Deleted!!");

                try
                {
                    HideRoleViews();
                    BindRoleList();
                    ViewRolesListDiv.Visible = true;

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
    protected void EditRoleBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideRoleViews();
            ViewRolesListDiv.Visible = true;
            BindRoleList();
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditRoleUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (EditRoleNameTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Role name field is blank!!");
                return;
            }
            if (EditRoleDescriptionTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Role description field is blank!!");
                return;
            }

            AuthRole updateRole = new AuthRole()
            {
                RoleID = (int)Session["CurrentEditRoleID"],
                RoleName = EditRoleNameTextBox.Text,
                RoleDescription = EditRoleDescriptionTextBox.Text

            };


            int response = Pasture.UpdateRole(updateRole);
            if (response > 0)
            {
                Clearrolefields();
                PastureAlert.PopSuccessAlert("Role successfly updated!!");
                Session["CurrentEditRoleID"] = null;
            }
            else
            {
                ShowErrorResponse("Role not updated kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Role type not updated Kindly Contact admin.");
            //throw;
        }
    }
    protected void ViewRoleBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideRoleViews();
            ViewRolesListDiv.Visible = true;
            BindRoleList();
        }
        catch (Exception)
        {

            throw;
        }
    }
    private void HideRoleViews()
    {
        AddRolesDiv.Visible = false;
        ViewRolesListDiv.Visible = false;
        EditRoleDiv.Visible = false;
        ViewRoleDiv.Visible = false;
    }

    #endregion

    #region Duty Type Management
    private void ClearDuty()
    {
        AddDutyTypeNameTextBox.Text = string.Empty;
        AddDutyTypeDescriptionTextBox.Text = string.Empty;
        EditDutyTypeNameTextBox.Text = string.Empty;
        EditDutyTypeDescriptionTextBox.Text = string.Empty;
    }
    protected void AddDutyTypeBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideDutyTypeViews();
            BindDutyTyepList();
            ViewDutyTypeListDiv.Visible = true;
            
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void AddDutyTypeProceedButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (AddDutyTypeNameTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type name field is blank!!");
                return;
            }

            if (AddDutyTypeStarttimeTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type start time field is blank!!");
                return;
            }

            if (AddDutyTypeEndtimeTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type end time field is blank!!");
                return;
            }

            if (AddDutyTypeDescriptionTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type description field is blank!!");
                return;
            }

            DutyType newDutyType = new DutyType()
            {
                DutyTypeName = AddDutyTypeNameTextBox.Text,
                StartTime = Convert.ToDateTime(AddDutyTypeStarttimeTextBox.Text).TimeOfDay,
                EndTime = Convert.ToDateTime(AddDutyTypeEndtimeTextBox.Text).TimeOfDay,
                Description = AddDutyTypeDescriptionTextBox.Text

            };


            int response = Pasture.AddNewDutyType(newDutyType);
            if (response > 0)
            {
                ClearDuty();
                PastureAlert.PopSuccessAlert("Duty type successfly created!!");
            }
            else
            {
                ShowErrorResponse("Duty type not created kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Duty type Not created Kindly Contact admin.");
            //throw;
        }
    }
    protected void ViewDutyTypeListAddButton_Click(object sender, EventArgs e)
    {
        HideDutyTypeViews();
        AddDutyTypeDiv.Visible = true;
    }
    protected void ViewDutyTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int dutytypeid = Convert.ToInt32((btn.CommandArgument.ToString()));
            //Session["CurrentEditRoleID"] = roleid;
            DutyType dutytype = Pasture.GetDutyTypeByID(dutytypeid);
            ViewDutyTypeNameTextbox.Text = dutytype.DutyTypeName;
            ViewDutyTypeDescriptionTextBox.Text = dutytype.Description;
            ViewDutyTypeStarttimeTextbox.Text = dutytype.StartTime.ToString();
            ViewDutyTypeEndtimeTextbox.Text = dutytype.EndTime.ToString();
            HideDutyTypeViews();
            ViewDutyTypeDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditDutyTypeBtn_Click(object sender, EventArgs e)
    {

        try
        {
            Button btn = (Button)sender;
            int dutytypeid = Convert.ToInt32((btn.CommandArgument.ToString()));
            //Session["CurrentEditRoleID"] = roleid;
            Session["CurrentEditDutyTypeID"] = dutytypeid;
            DutyType dutytype = Pasture.GetDutyTypeByID(dutytypeid);
            EditDutyTypeNameTextBox.Text = dutytype.DutyTypeName;
            EditDutyTypeDescriptionTextBox.Text = dutytype.Description;
            EditDutyTypeStarttimeTextBox.Text = dutytype.StartTime.ToString();
            EditDutyTypeEndtimeTextbox.Text = dutytype.EndTime.ToString();
            HideDutyTypeViews();
            EditDutyTypeDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void DeleteDutyTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int dutytypeid = Convert.ToInt32((btn.CommandArgument.ToString()));

            int response = Pasture.DeleteDutyTypeByID(dutytypeid);
            if (response > 0)
            {
                PastureAlert.PopSuccessAlert("Duty type successfly Deleted!!");

                try
                {
                    HideDutyTypeViews();
                    BindDutyTyepList();
                    ViewDutyTypeListDiv.Visible = true;

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
    protected void EditDutyTypeBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideDutyTypeViews();
            ViewDutyTypeListDiv.Visible = true;
            BindDutyTyepList();
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditDutyTypeUpdatebutton_Click(object sender, EventArgs e)
    {
        try
        {

            if (EditDutyTypeNameTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type name field is blank!!");
                return;
            }

            if (EditDutyTypeStarttimeTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type start time field is blank!!");
                return;
            }

            if (EditDutyTypeEndtimeTextbox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type end time field is blank!!");
                return;
            }

            if (EditDutyTypeDescriptionTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Duty type description field is blank!!");
                return;
            }

            DutyType updateDutyType = new DutyType()
            {
                DutyTypeID = (int)Session["CurrentEditDutyTypeID"],
                DutyTypeName = EditDutyTypeNameTextBox.Text,
                StartTime = Convert.ToDateTime(EditDutyTypeStarttimeTextBox.Text).TimeOfDay,
                EndTime = Convert.ToDateTime(EditDutyTypeEndtimeTextbox.Text).TimeOfDay,
                Description = EditDutyTypeDescriptionTextBox.Text

            };


            int response = Pasture.UpdateDutyType(updateDutyType);
            if (response > 0)
            {
                ClearDuty();
                PastureAlert.PopSuccessAlert("Duty type successfly updated!!");
            }
            else
            {
                ShowErrorResponse("Duty type not updated kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Duty type Not updated Kindly Contact admin.");
            //throw;
        }
    }
    protected void ViewDutyTypeBackButton_Click(object sender, EventArgs e)
    {
        try
        {
            HideDutyTypeViews();
            ViewDutyTypeListDiv.Visible = true;
            BindRoleList();
        }
        catch (Exception)
        {

            throw;
        }
    }

    private void HideDutyTypeViews()
    {
        AddDutyTypeDiv.Visible = false;
        ViewDutyTypeListDiv.Visible = false;
        EditDutyTypeDiv.Visible = false;
        ViewDutyTypeDiv.Visible = false;
    }

    #endregion

    #region Patient Plan Management 

    protected void AddPatientPlanBackButton_Click(object sender, EventArgs e)
    {
        HidePatientPlanViews();
        ViewPatientPlanListDiv.Visible = true;
        BindPatientPlanList();
    }

    protected void AddPatientPlanProceedButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (AddPatientPlanNameTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Patient plan name field is blank!!");
                return;
            }

            if (AddPatientPlanMaxNumberTextbox.Text == string.Empty)
            {
                ShowErrorResponse("Patient plan maximun number field is blank!!");
                return;
            }

            if (AddPatientPlanDescriptionTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Patient plan description field is blank!!");
                return;
            }

            PatientPlanType newPatientPlan = new PatientPlanType()
            {
                PlanTypeName = AddPatientPlanNameTextBox.Text,
                PlanTypeMaximumMember = Convert.ToInt32(AddPatientPlanMaxNumberTextbox.Text),
                PlanTypeDescription = AddPatientPlanDescriptionTextBox.Text

            };


            int response = Pasture.AddNewPatientPlan(newPatientPlan);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Patient plan successfly created!!");
            }
            else
            {
                ShowErrorResponse("Patient plan not created kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Patient plan not created Kindly Contact admin.");
            //throw;
        }
    }

    protected void ViewPatientPlanListAddNewPatientButton_Click(object sender, EventArgs e)
    {
        HidePatientPlanViews();
        BindPatientPlanList();
        AddPatientPlanDiv.Visible = true;
    }

    protected void ViewPlanTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int PatientPlanid = Convert.ToInt32((btn.CommandArgument.ToString()));

            PatientPlanType PatientPlan = Pasture.GetPatientPlanByID(PatientPlanid);
            ViewPatientPlanTextbox.Text = PatientPlan.PlanTypeName;
            ViewPatientPlanMaxNumberTextBox.Text = PatientPlan.PlanTypeMaximumMember.ToString();
            ViewPatientPlanDescriptionTextBox.Text = PatientPlan.PlanTypeDescription;


            HidePatientPlanViews();
            ViewPatientPlanDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void EditPlanTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int PatientPlanid = Convert.ToInt32((btn.CommandArgument.ToString()));
            //Session["CurrentEditRoleID"] = roleid;
            Session["CurrentEditPatientPlanID"] = PatientPlanid;
            PatientPlanType PatientPlan = Pasture.GetPatientPlanByID(PatientPlanid);
            EditPatientPlanNameTextBox.Text = PatientPlan.PlanTypeName;
            EditPatientPlanDescriptionTextBox.Text = PatientPlan.PlanTypeDescription;
            EditPatientPlanMaxNumTextBox.Text = PatientPlan.PlanTypeMaximumMember.ToString();


            HidePatientPlanViews();
            EditPatientPlanDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void DeletePlanTypeBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int PatientPlanid = Convert.ToInt32((btn.CommandArgument.ToString()));

            int response = Pasture.DeletePatientPlanByID(PatientPlanid);
            if (response > 0)
            {
                PastureAlert.PopSuccessAlert("Patient plan type successfly Deleted!!");

                try
                {
                    HidePatientPlanViews();
                    BindDutyTyepList();
                    ViewPatientPlanListDiv.Visible = true;
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

    protected void EditPatientPlanBackButton_Click(object sender, EventArgs e)
    {
        HidePatientPlanViews();
        ViewPatientPlanListDiv.Visible = true;
        BindPatientPlanList();
    }

    protected void EditPatientPlanUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (EditPatientPlanNameTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Patient plan name field is blank!!");
                return;
            }

            if (EditPatientPlanMaxNumTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Patient plan maximun number field is blank!!");
                return;
            }

            if (EditPatientPlanDescriptionTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Patient plan description field is blank!!");
                return;
            }

            PatientPlanType updatePatientPlan = new PatientPlanType()
            {
                PlanTypeID = (int)Session["CurrentEditPatientPlanID"],
                PlanTypeName = EditPatientPlanNameTextBox.Text,
                PlanTypeMaximumMember = Convert.ToInt32(EditPatientPlanMaxNumTextBox.Text),
                PlanTypeDescription = EditPatientPlanDescriptionTextBox.Text

            };


            int response = Pasture.UpdatePatientPlan(updatePatientPlan);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Patient plan  successfly updated!!");
            }
            else
            {
                ShowErrorResponse("Patient plan not updated kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Patient plan not updated Kindly Contact admin.");
            //throw;
        }

    }

    protected void ViewPatientPlanBackButton_Click(object sender, EventArgs e)
    {
        HidePatientPlanViews();
        ViewPatientPlanListDiv.Visible = true;
        BindPatientPlanList();
    }

    private void HidePatientPlanViews()
    {
        AddPatientPlanDiv.Visible = false;
        ViewPatientPlanListDiv.Visible = false;
        EditPatientPlanDiv.Visible = false;
        ViewPatientPlanDiv.Visible = false;
    }
    #endregion

    #region Assign Nurse Duty

    private void ClearNurseDutyFields()
    {
        AssignNurseDutyStartdateTextbox.Text = string.Empty;
        EditNurseDutyStartdateTextBox.Text = string.Empty;
    }
    protected void AssignNurseDutyBackButton_Click(object sender, EventArgs e)
    {
        HideNurseDutyViews();
        ViewNurseDutyListDiv.Visible = true;
        BindAssignedNurseDutyList();
    }
    protected void AssignNurseDutyProceedButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (AssignNurseDutyNurseDdl.SelectedValue.ToString() == "-1")
            {
                ShowErrorResponse("Nurse Not Selected!!");
                return;
            }

            if (AssignNurseDutyTypeDdl.SelectedValue.ToString() == "-1")
            {
                ShowErrorResponse("Duty type Not Selected!!");
                return;
            }
            if (AssignNurseDutyStartdateTextbox.Text == string.Empty)
            {
                ShowErrorResponse("Start Date field is blank!!");
                return;
            }

            if (AssignNurseDutyEnddateTextBox.Text == string.Empty)
            {
                ShowErrorResponse("End Date field is blank!!");
                return;
            }

            NurseDuty newNurseDuty = new NurseDuty()
            {
                NurseID = Convert.ToInt32(AssignNurseDutyNurseDdl.SelectedValue.ToString()),
                DutyTypeID = Convert.ToInt32(AssignNurseDutyTypeDdl.SelectedValue.ToString()),
                StartDate = Convert.ToDateTime(AssignNurseDutyStartdateTextbox.Text.ToString()),
                EndDate = Convert.ToDateTime(AssignNurseDutyEnddateTextBox.Text.ToString())

            };


            int response = Pasture.AddNewNurseDuty(newNurseDuty);
            if (response > 0)
            {
                ClearNurseDutyFields();
                PopulateDutyTypelist(AssignNurseDutyTypeDdl);
                PastureAlert.PopSuccessAlert("Nurse duty Assigned successfly created!!");
            }
            else
            {
                ShowErrorResponse("Nurse duty not Assigned kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Nurse duty not Assigned Kindly Contact admin.");
            //throw;
        }
    }
    protected void ViewNurseDutyBtn_Click(object sender, EventArgs e)
    {

        try
        {
           
            Button btn = (Button)sender;
            int nursedutyid = Convert.ToInt32((btn.CommandArgument.ToString()));
            NurseDuty viewnurseduty = Pasture.GetNurseDutyByID(nursedutyid);
            ViewNurseDutyNurseNameTextBox.Text = Pasture.GetEmployeeFullNameById(viewnurseduty.NurseID);
            ViewNurseDutyTypeTextBox.Text = Pasture.GetDutyTypeNameByID(viewnurseduty.DutyTypeID);
            ViewNurseDutyStartdateTextBox.Text = viewnurseduty.StartDate.ToString();
            ViewNurseDutyEnddateTextBox.Text = viewnurseduty.EndDate.ToString();
            HideNurseDutyViews();
            ViewNurseDutyDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditNurseDutyBtn_Click(object sender, EventArgs e)
    {
        try
        {
            PopulateDutyTypelist(EditNurseDutyTypeDdl);
            Button btn = (Button)sender;
            int nursedutyid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Session["CurrentEditNurseDutyD"] = nursedutyid;
            NurseDuty editnurseduty = Pasture.GetNurseDutyByID(nursedutyid);
            EditNurseDutyNursenameTextBox.Text = Pasture.GetEmployeeFullNameById(editnurseduty.NurseID);
            EditNurseDutyTypeDdl.SelectedValue = editnurseduty.DutyTypeID.ToString();
            EditNurseDutyStartdateTextBox.Text = editnurseduty.StartDate.Date.ToString("mm/dd/yyyy");
            EditNurseDutyEnddateTextBox.Text = editnurseduty.EndDate.Date.ToString("mm/dd/yyyy");
            HideNurseDutyViews();
            EditNurseDutyDiv.Visible = true;
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void DeleteNurseDutyBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int userid = Convert.ToInt32((btn.CommandArgument.ToString()));
            int response = Pasture.DeleteUserByID(userid);
            if (response > 0)
            {
                PastureAlert.PopSuccessAlert("Nurse Duty Successfly Deleted!!");

                try
                {
                    HideNurseDutyViews();
                    ViewNurseDutyListDiv.Visible = true;
                    BindAssignedNurseDutyList();

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
    protected void ViewNurseDutyListAddDutyButton_Click(object sender, EventArgs e)
    {
        HideNurseDutyViews();
        AssignNurseDutyDiv.Visible = true;
        PopulateNurselist(AssignNurseDutyNurseDdl);
        PopulateDutyTypelist(AssignNurseDutyTypeDdl);
    }
    protected void EditNurseDutyBackButton_Click(object sender, EventArgs e)
    {
        HideNurseDutyViews();
        ViewNurseDutyListDiv.Visible = true;
        BindAssignedNurseDutyList();
    }
    protected void EditNurseDutyUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (EditNurseDutyTypeDdl.SelectedValue.ToString() == "-1")
            {
                ShowErrorResponse("Duty type Not Selected!!");
                return;
            }
            if (EditNurseDutyStartdateTextBox.Text == string.Empty)
            {
                ShowErrorResponse("Start Date field is blank!!");
                return;
            }

            if (EditNurseDutyEnddateTextBox.Text == string.Empty)
            {
                ShowErrorResponse("End Date field is blank!!");
                return;
            }

            NurseDuty newNurseDuty = new NurseDuty()
            {
                //NurseID = Convert.ToInt32(Ed.SelectedValue.ToString()),
                NurseDutyID =(int) Session["CurrentEditNurseDutyD"],//from session
                DutyTypeID = Convert.ToInt32(EditNurseDutyTypeDdl.SelectedValue.ToString()),
                StartDate = Convert.ToDateTime(EditNurseDutyStartdateTextBox.Text.ToString()),
                EndDate = Convert.ToDateTime(EditNurseDutyEnddateTextBox.Text.ToString())

            };


            int response = Pasture.UpdateNurseDuty(newNurseDuty);
            if (response > 0)
            {
                ClearNurseDutyFields();
                PopulateDutyTypelist(AssignNurseDutyTypeDdl);
                PastureAlert.PopSuccessAlert("Nurse duty updated successfly created!!");
            }
            else
            {
                ShowErrorResponse("Nurse duty not updated kindly try again!!");
            }


        }
        catch (Exception)
        {
            PastureAlert.PopErrorAlert("Nurse duty not updated Kindly Contact admin.");
            //throw;
        }
    }
    protected void ViewNurseDutyBackButton_Click(object sender, EventArgs e)
    {
        HideNurseDutyViews();
        ViewNurseDutyListDiv.Visible = true;
        BindAssignedNurseDutyList();
    }
    private void HideNurseDutyViews()
    {
        AssignNurseDutyDiv.Visible = false;
        ViewNurseDutyDiv.Visible = false;
        EditNurseDutyDiv.Visible = false;
        ViewNurseDutyListDiv.Visible = false;
    }

    #endregion

    #region Page Search Event

    protected void UserSearchButton_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(UserSearchEmployeeNameddl.SelectedValue.ToString());
        string Hmsuserid = UserSearchEmployeeHMSID.Text;
        if (userid > 0)
        {
            UserListGridView.DataSource = Pasture.GetUsersByEmpIDandUsername(userid, Hmsuserid);
        }
        else
        {
            UserListGridView.DataSource = Pasture.GetUsersByUsername(Hmsuserid);
        }


        UserListGridView.DataBind();
        //PopulateEmployeelist(UserSearchEmployeeNameddl);
    }
    protected void AttendanceSearchButton_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(AttendanceSearchEmployeeNameddl.SelectedValue.ToString());
        if (userid > 0)
        {
            AttendanceLogListGridView.DataSource = Pasture.GetAttendanceLogByUserIDList(userid);
            AttendanceLogListGridView.DataBind();
            //PopulateEmployeelist(AttendanceSearchEmployeeNameddl);
        }
        else
        {
            BindAttendanceLogList();
        }

    }

    #endregion

    #region Hospital Detail

    protected void AddHospitalDetailProceedButton_Click(object sender, EventArgs e)
    {
        //add
        HospitalInfo HospInfo = Pasture.GetHospitalInfo();

        if (HospInfo == null)
        {
            HospInfo = new HospitalInfo();
            HospInfo.HospitalName = AddHospitalNameTextBox.Text;
            HospInfo.Email = AddHospitalEmailTextBox.Text;
            HospInfo.Address = AddHospitalAddressTextbox.Text;
            HospInfo.Wedsite = AddHospitalWedsiteTextBox.Text;
            HospInfo.PhoneNumber = AddHospitalPhoneNumberTextbox.Text;

            int responce = Pasture.AddHospitalInfo(HospInfo);

            if (responce > 0)
            {
                PastureAlert.PopSuccessAlert("Hospital Detail successfly added!!");
                HideHospitalDetailDivs();
                LoadHospitalDetail();
                ViewHospitalDetailDiv.Visible = true;
            }
            else
            {
                ShowErrorResponse("Hospital Detail not added kindly try again!!");
            }
        }
        else
        {
            HideHospitalDetailDivs();
            LoadHospitalDetail();
            ViewHospitalDetailDiv.Visible = true;
        }
    }
    protected void EditHospitalDetailBackButton_Click(object sender, EventArgs e)
    {
        //Back to view
        HideHospitalDetailDivs();
        LoadHospitalDetail();
        ViewHospitalDetailDiv.Visible = true;
    }
    protected void EdiHospitalDetailUpdateButton_Click(object sender, EventArgs e)
    {
        HospitalInfo HospInfo = Pasture.GetHospitalInfo();

        if (HospInfo != null)
        {
            HospInfo.HospitalName = EditHospitalNameTextBox.Text;
            HospInfo.Email = EditHospitalEmailTextBox.Text;
            HospInfo.Address = EditHospitalAddressTextbox.Text;
            HospInfo.Wedsite = EditHospitalWedsiteTextBox.Text;
            HospInfo.PhoneNumber = EditHospitalPhoneNumberTextbox.Text;

            int responce = Pasture.UpdateHospitalInfo(HospInfo);

            if (responce > 0)
            {
                PastureAlert.PopSuccessAlert("Hospital Detail successfly updated!!");
            }
            else
            {
                ShowErrorResponse("Hospital Detail not updated kindly try again!!");
            }
        }
        else
        {
            HideHospitalDetailDivs();
            EditHospitalDetailDiv.Visible = true;
        }
        //update
    }
    protected void ViewHospitalDetailEditButton_Click(object sender, EventArgs e)
    {
        //goto edit
        HospitalInfo HospInfo = Pasture.GetHospitalInfo();

        if (HospInfo != null)
        {
            EditHospitalNameTextBox.Text = HospInfo.HospitalName;
            EditHospitalEmailTextBox.Text = HospInfo.Email;
            EditHospitalAddressTextbox.Text = HospInfo.Address;
            EditHospitalWedsiteTextBox.Text = HospInfo.Wedsite;
            EditHospitalPhoneNumberTextbox.Text = HospInfo.PhoneNumber;
            HideHospitalDetailDivs();
            EditHospitalDetailDiv.Visible = true;
        }
        else
        {
            HideHospitalDetailDivs();
            AddHospitalDetailDiv.Visible = true;
        }
    }
    private void HideHospitalDetailDivs()
    {
        AddHospitalDetailDiv.Visible = false;
        EditHospitalDetailDiv.Visible = false;
        ViewHospitalDetailDiv.Visible = false;
    }
    private void LoadHospitalDetail()
    {
        HospitalInfo HospInfo = Pasture.GetHospitalInfo();

        if (HospInfo != null)
        {
            ViewHospitalNameTextBox.Text = HospInfo.HospitalName;
            ViewHospitalEmailTextBox.Text = HospInfo.Email;
            ViewHospitalAddressTextbox.Text = HospInfo.Address;
            ViewHospitalWedsiteTextBox.Text = HospInfo.Wedsite;
            ViewHospitalPhoneNumberTextbox.Text = HospInfo.PhoneNumber;
        }
        else
        {
            HideHospitalDetailDivs();
            AddHospitalDetailDiv.Visible = true;
        }
    }

    #endregion



    protected void UserListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserListGridView.PageIndex = e.NewPageIndex;
        BindUserList();
    }

    protected void transactiontypeListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        transactiontypeListGridView.PageIndex = e.NewPageIndex;
        BindTranxTypeList();
    }

    protected void RoleListGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        RoleListGrid.PageIndex = e.NewPageIndex;
        BindRoleList();
    }

    protected void DutyTypeListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DutyTypeListGridView.PageIndex = e.NewPageIndex;
        BindDutyTyepList();
    }

    protected void PatientPlanListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        PatientPlanListGridView.PageIndex = e.NewPageIndex;
        BindPatientPlanList();
    }

    protected void NurseDutyListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        NurseDutyListGridView.PageIndex = e.NewPageIndex;
        BindAssignedNurseDutyList();
    }

    protected void AttendanceLogListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        AttendanceLogListGridView.PageIndex = e.NewPageIndex;
        BindAttendanceLogList();
    }
}