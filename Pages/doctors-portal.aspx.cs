﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_doctors_portal : System.Web.UI.Page
{
    bool IsPageRefresh = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthUser CurrentUser = Pasture.GetCurrentUserSessionDetail();

        if(CurrentUser != null)
        {
            int haveopenedattendance =Pasture.GetUnlockedAttendanceLogByUserIDList(CurrentUser.StaffID);
            if (haveopenedattendance > 0)
            {
                //open doctors portal
                AttendanceSigninButton.Text = "SIGN OUT";
            }
            else
            {
                //open attendace sheet
                SetAttendanceContainerVisible();
                AttendanceCurrentTime.Text = Pasture.GetAttendanceDateTime();
            }
        }



        if (!Page.IsPostBack)
        {
            ViewState["ViewStateId"] = System.Guid.NewGuid().ToString();
            Session["SessionId"] = ViewState["ViewStateId"].ToString();
            HideDivsDocTab();
            ViewDoctorListDiv.Visible = true;
            //DoctorListGridView.DataSource = LoadOrderItems();
            //DoctorListGridView.DataBind();

            BindGrid();

        }
        else
        {
            if (ViewState["ViewStateId"].ToString() != Session["SessionId"].ToString())
            {
                IsPageRefresh = true;
            }
            Session["SessionId"] = System.Guid.NewGuid().ToString();
            ViewState["ViewStateId"] = Session["SessionId"].ToString();
        }

    }
    #region WrittenBy Ola
 

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

        Alert.CallAlert(Alert.Alerttype.warning.ToString(), "Check and try again.");
        //Alert.CallAlert(Alert.Alerttype.error.ToString(), "Operation can not be done.");
        return;
    }

    private void HideContentView()
    {
        doctor.Visible = false;
        doctorli.Attributes["class"] = "";
        attendance.Visible = false;
        attendanceli.Attributes["class"] = "";
    }
    #endregion

    private static HSMModelDataContext context = new HSMModelDataContext();
    protected void btnAddNewDoc_Click(object sender, EventArgs e)
    {
        //Redirect to Add New Page
        HideDivsDocTab();
        AddNewDoctorDiv.Visible = true;
    }

    protected void btnProceed_Click(object sender, EventArgs e)
    {
        try
        {
            if (IsPageRefresh == true)
                return;

            //Save to DB
            int result = Pasture.AddNewEmployee(new Employee()
            {
                FirstName = txtFirstname.Text.Trim(),
                LastName = txtLastname.Text.Trim(),
                OtherNames = txtOthername.Text.Trim(),
                StaffTypeID = (int)Pasture.EmployeeType.Doctor, //2,//2 doctor 
                Gender = ddlGender.SelectedItem.Text.Trim(),
                MaritalStatus = ddlMaritalStatus.SelectedItem.Text.Trim(),
                PhoneNumber = txtPhone.Text.Trim(),
                Address = txtAddress.Text.Trim(),
                DOB = Convert.ToDateTime(txtDOB.Text).Date,
            });


            if (result > 0)
            {
                //Bind Grid
                BindGrid();
                HideDivsDocTab();
                ViewDoctorListDiv.Visible = true;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    protected void DoctorListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            string itemID = (row.FindControl("lblEmployeeID") as Label).Text;
            string StaffTypeID = (row.FindControl("lblStaffTypeID") as Label).Text;

            ViewState["itemID"] = itemID;
            ViewState["StaffTypeID"] = StaffTypeID;

            if (e.CommandArgument.Equals("View"))
            {
                txtFirstnameV.Text = (row.FindControl("lblFirstName") as Label).Text;
                txtLastnameV.Text = (row.FindControl("lblLastName") as Label).Text;
                txtPhoneV.Text = (row.FindControl("lblPhoneNumber") as Label).Text;
                txtGenderV.Text = (row.FindControl("lblGender") as Label).Text;
                txtAddressV.Text = (row.FindControl("lblAddress") as Label).Text;
                txtMaritalStatusV.Text = (row.FindControl("lblMaritalStatus") as Label).Text;
                txtDOBV.Text = Convert.ToDateTime((row.FindControl("lblDOB") as Label).Text).ToString("yyyy-MM-dd");

                //HideDivs
                HideDivsDocTab();
                ViewDoctorDiv.Visible = true;
            }
            else if (e.CommandArgument.Equals("Edit"))
            {
                txtFirstnameE.Text = (row.FindControl("lblFirstName") as Label).Text;
                txtLastnameE.Text = (row.FindControl("lblLastName") as Label).Text;
                txtPhoneE.Text = (row.FindControl("lblPhoneNumber") as Label).Text;
                ddlGenderE.SelectedItem.Text = (row.FindControl("lblGender") as Label).Text;
                ddlMaritalStatusE.SelectedItem.Text = (row.FindControl("lblMaritalStatus") as Label).Text;
                txtAddressE.Text = (row.FindControl("lblAddress") as Label).Text;
                txtDOBE.Text = Convert.ToDateTime((row.FindControl("lblDOB") as Label).Text).ToString("yyyy-MM-dd");

                //HideDivs
                HideDivsDocTab();
                EditDoctorDiv.Visible = true;
            }
            else if (e.CommandArgument.Equals("Deactivate"))
            {
                bool result;
                string btnValue = (row.FindControl("DeleteRoleBtn") as Button).Text;
                switch (btnValue)
                {
                    case "Deactivate":
                        result = Pasture.DeactivateEmployee(int.Parse(itemID));
                        if (result)
                        {
                            BindGrid();
                            //DisableButton(e);
                            SxsMessage("Doctor Deactivated");
                        }
                        break;

                    case "Activate":
                        result = Pasture.ActivateEmployee(int.Parse(itemID));
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
            else
            {
                //Delete
                int result = Pasture.DeleteEmployee(int.Parse(itemID));
                if (result > 0)
                {
                    //Bind Data to Grid
                    BindGrid();
                    SxsMessage("Doctor deleted");
                }

            }
        }
        catch (Exception ex)
        {

            throw new Exception(ex.Message);
        }
    }

    protected void btnBackView_Click(object sender, EventArgs e)
    {
        HideDivsDocTab();
        ViewDoctorListDiv.Visible = true;
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
                HideDivsDocTab();
                ViewDoctorListDiv.Visible = true;
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    #region HelperClasses

    /// <summary>
    /// Success message
    /// </summary>
    /// <param name="message"></param>
    public void SxsMessage(string message)
    {
        ResponseAlert.NewMessage = message;
        ResponseAlert.NoteType = PastureAlert.ResponseNotetype.success.ToString();//"Success";
        ResponseAlert.NoteVisible = true;
        ResponseAlert.ShowNotification();
        return;
    }

    /// <summary>
    /// Hide div in Doctor Tab
    /// </summary>
    public void HideDivsDocTab()
    {
        AddNewDoctorDiv.Visible = false;
        ViewDoctorListDiv.Visible = false;
        EditDoctorDiv.Visible = false;
        ViewDoctorDiv.Visible = false;
    }

    /// <summary>
    /// Bind Data to Grid:
    /// TODO: filter by IsActive
    /// </summary>
    public void BindGrid()
    {
        try
        {
            var data = Pasture.GetDoctorsList();
            if (!(data.Count < 1))
            {
                DoctorListGridView.DataSource = data;
                DoctorListGridView.DataBind();
            }
            else
            {
                //DoctorListGridView.Caption = "You have no doctor yet";
                DoctorListGridView.DataSource = data;
                DoctorListGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public void EnableButton(GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
        Button btnEdit = ((Button)row.FindControl("btnEdit"));
        Button btnDelete = ((Button)row.FindControl("btnDelete"));
        btnEdit.Attributes["class"] = "enable";
        btnDelete.Attributes["class"] = "enable";
    }

    public void DisableButton(GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
        Button btnEdit = ((Button)row.FindControl("btnEdit"));
        Button btnDelete = ((Button)row.FindControl("btnDelete"));
        btnEdit.Attributes["class"] = "disabled";
        btnDelete.Attributes["class"] = "disabled";
    }
    #endregion


    protected void DoctorDivNav_Click(object sender, EventArgs e)
    {
        SetDoctorContainerVisible();
        BindGrid();
    }

    protected void AttendanceDivNav_Click(object sender, EventArgs e)
    {
        SetAttendanceContainerVisible();
    }

    private void SetDoctorContainerVisible()
    {
        HideContentView();
        doctorli.Attributes["class"] = "active";
        doctor.Visible = true;
    }
    private void SetAttendanceContainerVisible()
    {
        HideContentView();
        attendanceli.Attributes["class"] = "active";
        attendance.Visible = true;
        attendance.Attributes["class"] = "tab-pane fade active in";
    }

    protected void btnAddNewBack_Click(object sender, EventArgs e)
    {
        HideDivsDocTab();
        ViewDoctorListDiv.Visible = true;
    }

    protected void btnEditBack_Click(object sender, EventArgs e)
    {
        HideDivsDocTab();
        DoctorListGridView.Visible = true;
    }
}