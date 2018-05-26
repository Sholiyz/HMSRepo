using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_nurse_portal : System.Web.UI.Page
{
    bool IsPageRefresh = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthUser CurrentUser = Pasture.GetCurrentUserSessionDetail();
        if (CurrentUser != null)
        {
            string role = Pasture.GetCurrentUserSessionRole();
            ManageRoleView(role);
            int haveopenedattendance = Pasture.GetUnlockedAttendanceLogByUserIDList(CurrentUser.UserID);
            if (haveopenedattendance > 0)
            {
                //open doctors portal
                //open doctors portal
                EmployeeNameFullName.Text = Pasture.GetEmployeeFullNameById(CurrentUser.StaffID);
                AttendanceCurrentTime.Text = Pasture.GetAttendanceDateTime();
                attandancemsg.InnerText = "GOOD BYE CLICK SIGN OUT TO CLOSE TODAY'S DUTY";
                AttendanceSigninButton.Text = "SIGN OUT";
            }
            else
            {
                //open attendace sheet
                SetAttendanceContainerVisible();
                EmployeeNameFullName.Text = Pasture.GetEmployeeFullNameById(CurrentUser.StaffID);
                AttendanceCurrentTime.Text = Pasture.GetAttendanceDateTime();
                //Response.Redirect("./patient-portal.aspx");
                return;
            }
        }

        if (!Page.IsPostBack)
        {
            //ViewState["ViewStateId"] = System.Guid.NewGuid().ToString();
            //Session["SessionId"] = ViewState["ViewStateId"].ToString();
            string role = Pasture.GetCurrentUserSessionRole();
            if (role != null)
            {
                ManageRoleView(role);
                
            }
            else
            {
                Response.Redirect("./login.aspx");
                return;
            }
           
        }
        //else
        //{
        //    if (ViewState["ViewStateId"].ToString() != Session["SessionId"].ToString())
        //    {
        //        IsPageRefresh = true;
        //    }
        //    Session["SessionId"] = System.Guid.NewGuid().ToString();
        //    ViewState["ViewStateId"] = Session["SessionId"].ToString();
        //}
    }

    #region Written By Ola
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
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.success.ToString();//"Success";
        ResponseAlert.NoteVisible = true;


        ResponseAlert.ShowNotification();
        return;


    }

    protected void ShowPopAlert_Click(object sender, EventArgs e)
    {
        //Call Pop up Alert

        Alert.CallAlert(Alert.Alerttype.warning.ToString(), "Check and try again.");
        //Alert.CallAlert(Alert.Alerttype.error.ToString(), "Operation can not be done.");
        return;
    }
    #endregion

    #region Helper Methods
    public void HideDivsNurseTab()
    {
        ViewNurseDiv.Visible = false;
        ViewNurseListDiv.Visible = false;
        EditNurseDiv.Visible = false;
        AddNewNurseDiv.Visible = false;
    }

    public void BindGrid()
    {
        try
        {
            var data = Pasture.GetNursesList();
            if (!(data.Count < 1))
            {
                NurseListGridView.DataSource = data;
                NurseListGridView.DataBind();
            }
            else
            {
                //DoctorListGridView.Caption = "You have no doctor yet";
                NurseListGridView.DataSource = data;
                NurseListGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public void SxsMessage(string message)
    {
        ResponseAlert.NewMessage = message;
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.success.ToString();//"Success";
        ResponseAlert.NoteVisible = true;
        ResponseAlert.ShowNotification();
        return;
    }

    private void SetNurseContainerVisible()
    {
        HideContentView();
        nurseli.Attributes["class"] = "active";
        nurse.Visible = true;
      
    }
    private void SetAttendanceContainerVisible()
    {
        HideContentView();
        attendanceli.Attributes["class"] = "active";
        attendance.Visible = true;
        attendance.Attributes["class"] = "tab-pane fade active in";
    }

    public Byte[] InsertImage(FileUpload fileupload)
    {
        Byte[] imgbyte = null;
        if (fileupload.HasFile)
        {
            HttpPostedFile file = fileupload.PostedFile;
            imgbyte = new Byte[file.ContentLength];
            file.InputStream.Read(imgbyte, 0, file.ContentLength);
        }
        return imgbyte;
    }

    public string GetImage(string staffID)
    {
        Employee Emp = Pasture.GetEmployeeByID(int.Parse(staffID));
        string imageString = string.Empty;
        byte[] bytes = (byte[])Emp.Picture;
        if (bytes != null)
        {
            imageString = Convert.ToBase64String(bytes, 0, bytes.Length);
        }
        return imageString;
    }


    public string GetImageString(byte[] picture)
    {
        string imageString = string.Empty;
        byte[] bytes = picture;
        if (bytes != null)
        {
            imageString = Convert.ToBase64String(bytes, 0, bytes.Length);
        }
        return imageString;
    }

    #endregion


    #region CRUD
    public void btnView_Click(object sender, EventArgs e)// EventArgs e
    {
        Button btn = (Button)sender;
        int empId = Convert.ToInt32((btn.CommandArgument.ToString()));
        Employee emp = Pasture.GetEmployeeByID(empId);

        string imgurl = GetImageString(emp.Picture); // GetImage(empId);

        txtFirstnameV.Text = emp.FirstName;
        txtLastnameV.Text = emp.LastName;
        txtOthernamesV.Text = emp.OtherNames;
        txtPhoneV.Text = emp.PhoneNumber;
        txtGenderV.Text = emp.Gender.ToString();
        txtAddressV.Text = emp.Address;
        txtMaritalStatusV.Text = emp.MaritalStatus;
        txtDOBV.Text = emp.DOB.ToString("yyyy-MM-dd");
        nurseViewImage.ImageUrl = "data:image/png;base64," + imgurl;

        //HideDivs
        HideDivsNurseTab();
        ViewNurseDiv.Visible = true;

    }

    public void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int empId = Convert.ToInt32((btn.CommandArgument.ToString()));
        Employee emp = Pasture.GetEmployeeByID(empId);
        ViewState["EmpID"] = empId;

        string imgurl = GetImageString(emp.Picture); // GetImage(empId);

        txtFirstnameE.Text = emp.FirstName; //(row.FindControl("lblFirstName") as Label).Text;
        txtLastnameE.Text = emp.LastName; //(row.FindControl("lblLastName") as Label).Text;
        txtOthernamesE.Text = emp.OtherNames;
        txtPhoneE.Text = emp.PhoneNumber; //(row.FindControl("lblPhoneNumber") as Label).Text;
        ddlGenderE.SelectedItem.Text = emp.Gender.ToString(); //(row.FindControl("lblGender") as Label).Text;
        ddlMaritalStatusE.SelectedItem.Text = emp.MaritalStatus; //(row.FindControl("lblMaritalStatus") as Label).Text;
        txtAddressE.Text = emp.Address; //(row.FindControl("lblAddress") as Label).Text;
        txtDOBE.Text = emp.DOB.ToString("yyyy-MM-dd"); //Convert.ToDateTime((row.FindControl("lblDOB") as Label).Text).ToString("yyyy-MM-dd");
        nurseEditImage.ImageUrl = "data:image/png;base64," + imgurl;

        //HideDivs
        HideDivsNurseTab();
        EditNurseDiv.Visible = true;
    }

    public void btnDeActivate_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        int empId = Convert.ToInt32((btn.CommandArgument.ToString()));
        //Employee emp = Pasture.GetEmployeeByID(empId);

        bool result;
        string btnValue = btn.Text; //(row.FindControl("btnDeactivate") as Button).Text;
        switch (btnValue)
        {
            case "Deactivate":
                result = Pasture.DeactivateEmployee(empId);
                if (result)
                {
                    BindGrid();
                    //DisableButton(e);
                    SxsMessage("Doctor Deactivated");
                }
                break;

            case "Activate":
                result = Pasture.ActivateEmployee(empId);
                if (result)
                {
                    BindGrid();
                    //EnableButton(e);
                    SxsMessage("Doctor Activated");
                }
                break;
            default:
                break;
        }

    }

    public void btnDelete_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        int empId = Convert.ToInt32((btn.CommandArgument.ToString()));
        //Delete
        int result = Pasture.DeleteEmployee(empId);
        if (result > 0)
        {
            //Bind Data to Grid
            BindGrid();
            SxsMessage("Doctor deleted");
        }
    }
    #endregion

    #region Navigation
    protected void btnAddNewDoc_Click(object sender, EventArgs e)
    {
        //Redirect to Add New Page
        HideDivsNurseTab();
        AddNewNurseDiv.Visible = true;
    }

    protected void btnProceed_Click(object sender, EventArgs e)
    {
        try
        {
            if (IsPageRefresh == true)
                return;
            
            //Process Image
            byte[] image = InsertImage(FileUploadNurse);

            //Save to DB
            int result = Pasture.AddNewEmployee(new Employee()
            {
                Picture = image,
                FirstName = txtFirstname.Text.Trim(),
                LastName = txtLastname.Text.Trim(),
                OtherNames = txtOthername.Text.Trim(),
                StaffTypeID = (int)Pasture.EmployeeType.Nurse, //2,//2 doctor 
                Gender = ddlGender.SelectedItem.Text.Trim(),
                MaritalStatus = ddlMaritalStatus.SelectedItem.Text.Trim(),
                PhoneNumber = txtPhone.Text.Trim(),
                Address = txtAddress.Text.Trim(),
                DOB = Convert.ToDateTime(txtDOB.Text).Date,
            });
            
            if (result > 0)
            {
                BindGrid();
                HideDivsNurseTab();
                ViewNurseListDiv.Visible = true;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    protected void btnAddNewBack_Click(object sender, EventArgs e)
    {
        HideDivsNurseTab();
        ViewNurseListDiv.Visible = true;
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int result = Pasture.UpdateEmployee(new Employee
            {
                FirstName = txtFirstnameE.Text.Trim(),
                LastName = txtLastnameE.Text.Trim(),
                OtherNames = txtOthernamesE.Text.Trim(),
                Gender = ddlGenderE.SelectedItem.Text.Trim(),
                MaritalStatus = ddlMaritalStatusE.SelectedItem.Text.Trim(),
                PhoneNumber = txtPhoneE.Text.Trim(),
                Address = txtAddressE.Text.Trim(),
                DOB = Convert.ToDateTime(txtDOBE.Text).Date,
                EmployeeID = Convert.ToInt32(ViewState["EmpID"])
            });

            if (result > 0)
            {
                //Bind to Grid
                BindGrid();
                HideDivsNurseTab();
                ViewNurseListDiv.Visible = true;
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void btnEditBack_Click(object sender, EventArgs e)
    {
        HideDivsNurseTab();
        ViewNurseListDiv.Visible = true;
    }

    protected void btnBackView_Click(object sender, EventArgs e)
    {
        HideDivsNurseTab();
        ViewNurseListDiv.Visible = true;
    }

    protected void NurseDivNav_Click(object sender, EventArgs e)
    {
        SetNurseContainerVisible();
        BindGrid();
    }

    protected void AttendanceDivNav_Click(object sender, EventArgs e)
    {
        SetAttendanceContainerVisible();
    }
    private void HideContentView()
    {
        nurse.Visible = false;
        nurseli.Attributes["class"] = "";
        attendance.Visible = false;
        attendanceli.Attributes["class"] = "";
    }
    #endregion

    #region Attendance
    protected void AttendanceSigninButton_Click(object sender, EventArgs e)
    {
        AuthUser CurrentUser = Pasture.GetCurrentUserSessionDetail();
        int currentuserlog = Pasture.GetUnlockedAttendanceLogByUserIDList(CurrentUser.UserID);
        TimeSpan AttendanceTime = Convert.ToDateTime(AttendanceCurrentTime.Text.ToString()).TimeOfDay;
        if (currentuserlog > 0)
        {//false exist means there is a sign in not yet signed out sign out


            AttendanceLog AttLog = new AttendanceLog();
            int response = Pasture.ClockUserOutAttendanceLog(CurrentUser.UserID, AttendanceTime);
            if (response > 0)
            {
                PastureAlert.PopSuccessAlert("You have successfully signed out.");
                Response.Redirect("./patient-portal.aspx");
            }
        }
        else
        {//add new attendace sign in
            AttendanceLog UserAttendance = new AttendanceLog();
            UserAttendance.ClockInTime = AttendanceTime;
            int response = Pasture.ClockUserInAttendanceLog(UserAttendance);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("You have successfully signed in.");
                Response.Redirect("./patient-portal.aspx");
                return;
            }
        }
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
            SetNurseContainerVisible();
            BindGrid();
            HideDivsNurseTab();
            ViewNurseListDiv.Visible = true;
            return;
        }
        if (rolename.ToLower().Contains("nurse"))
        {
            dashboard.Visible = false;
            patientsportal.Visible = true;
            nursesportal.Visible = true;
            doctorsportal.Visible = false;
            adminportal.Visible = false;
            nurseli.Visible = false;
            NurseDivNav.Visible = false;
            SetAttendanceContainerVisible();
            return;
            
        }
        if (rolename.ToLower().Contains("doctor"))
        {
            
            patientsportal.Visible = true;
            doctorsportal.Visible = true;
            SetAttendanceContainerVisible();
            return;
        }
        else
        {
           
        }

    }

    #endregion




    protected void NurseListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        NurseListGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}
