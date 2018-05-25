﻿using System;
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
                Response.Redirect("./patient-portal.aspx");
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

    //protected void PictureViewButton_Click(object sender, EventArgs e)
    //{
    //    byte[] imagesinsert = InsertImage(FileUploadNurse);
    //    HttpPostedFile file = FileUploadNurse.PostedFile;
    //    string imageString = "";
    //    if (imagesinsert != null)
    //    {
    //        imageString = Convert.ToBase64String(imagesinsert, 0, imagesinsert.Length);
    //    }
    //    FileUploadNurse.Equals(file);
    //    Addnurseimage.ImageUrl = "data:image/png;base64," + imageString;
    //}
    #endregion

    #region CRUD
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

    protected void NurseListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            string itemID = (row.FindControl("lblEmployeeID") as Label).Text;
            string StaffTypeID = (row.FindControl("lblStaffTypeID") as Label).Text;

            ViewState["itemID"] = itemID;
            ViewState["StaffTypeID"] = StaffTypeID;

            //GetImage
            string imgurl = GetImage(itemID);

            if (e.CommandArgument.Equals("View"))
            {
                txtFirstnameV.Text = (row.FindControl("lblFirstName") as Label).Text;
                txtLastnameV.Text = (row.FindControl("lblLastName") as Label).Text;
                txtOthernamesV.Text= (row.FindControl("lblOtherName") as Label).Text; 
                txtPhoneV.Text = (row.FindControl("lblPhoneNumber") as Label).Text;
                txtGenderV.Text = (row.FindControl("lblGender") as Label).Text;
                txtAddressV.Text = (row.FindControl("lblAddress") as Label).Text;
                txtMaritalStatusV.Text = (row.FindControl("lblMaritalStatus") as Label).Text;
                txtDOBV.Text = Convert.ToDateTime((row.FindControl("lblDOB") as Label).Text).ToString("yyyy-MM-dd");
                nurseViewImage.ImageUrl = "data:image/png;base64," + imgurl;

                //HideDivs
                HideDivsNurseTab();
                ViewNurseDiv.Visible = true;
            }
            else if (e.CommandArgument.Equals("Edit"))
            {
                txtFirstnameE.Text = (row.FindControl("lblFirstName") as Label).Text;
                txtLastnameE.Text = (row.FindControl("lblLastName") as Label).Text;
                txtPhoneE.Text = (row.FindControl("lblPhoneNumber") as Label).Text;
                txtOthernamesE.Text = (row.FindControl("lblOtherName") as Label).Text;
                ddlGenderE.SelectedItem.Text = (row.FindControl("lblGender") as Label).Text;
                ddlMaritalStatusE.SelectedItem.Text = (row.FindControl("lblMaritalStatus") as Label).Text;
                txtAddressE.Text = (row.FindControl("lblAddress") as Label).Text;
                txtDOBE.Text = Convert.ToDateTime((row.FindControl("lblDOB") as Label).Text).ToString("yyyy-MM-dd");
                nurseEditImage.ImageUrl = "data:image/png;base64," + imgurl;

                //HideDivs
                HideDivsNurseTab();
                EditNurseDiv.Visible = true;
            }
            else if (e.CommandArgument.Equals("Deactivate"))
            {
                bool result;
                string btnValue = (row.FindControl("btnDeactivate") as Button).Text;
                switch (btnValue)
                {
                    case "Deactivate":
                        result = Pasture.DeactivateEmployee(int.Parse(itemID));
                        if (result)
                        {
                            BindGrid();
                            //DisableButton(e);
                            SxsMessage("Nurse Deactivated");
                        }
                        break;

                    case "Activate":
                        result = Pasture.ActivateEmployee(int.Parse(itemID));
                        if (result)
                        {
                            BindGrid();
                            //EnableButton(e);
                            SxsMessage("Nurse Activated");
                        }
                        break;
                    default:
                        break;
                }
            }
            else
            {
                //Delete
                int result = Pasture.DeleteEmployee(int.Parse(itemID));
                if (result > 0)
                {
                    //Bind Data to Grid
                    BindGrid();
                    SxsMessage("Nurse deleted");
                }

            }
        }
        catch (Exception ex)
        {

            throw new Exception(ex.Message);
        }
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
                EmployeeID = Convert.ToInt32(ViewState["itemID"])
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



}
