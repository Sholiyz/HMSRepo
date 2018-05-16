using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_doctors_portal : System.Web.UI.Page
{
    bool IsPageRefresh = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            ViewState["ViewStateId"] = System.Guid.NewGuid().ToString();
            Session["SessionId"] = ViewState["ViewStateId"].ToString();
            HideDivsDocTab();
            ViewDoctorListDiv.Visible = true;
            DoctorListGridView.DataSource = LoadOrderItems();
            DoctorListGridView.DataBind();
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
    #endregion


    HSMModelDataContext context = new HSMModelDataContext();



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
            context.Doctors.Add(new Doctor()
            {
                FirstName = txtFirstname.Text.Trim(),
                LastName = txtLastname.Text.Trim(),
                OtherNames = txtOthername.Text.Trim(),
                Gender = ddlGender.SelectedItem.Text.Trim(),
                PhoneNumber = txtPhone.Text.Trim(),
                Address = txtAddress.Text.Trim(),
                DOB = Convert.ToDateTime(txtDOB.Text).Date,
            });
            if (context.SaveChanges() > 0)
            {
                HideDivsDocTab();
                ViewDoctorListDiv.Visible = true;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        //Validate and save into db
        //Doctor doc = new Doctor()
        //{
        //    FirstName = txtFirstname.Text.Trim(),
        //    LastName = txtLastname.Text.Trim(),
        //    OtherNames = txtOthername.Text.Trim(),
        //    Gender = ddlGender.SelectedItem.Text.Trim(),
        //    PhoneNumber = txtPhone.Text.Trim(),
        //    Address = txtAddress.Text.Trim(),
        //    DOB = Convert.ToDateTime(txtDOB.Text).Date,
        //};
        
    }

    protected void DoctorListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string itemID = (DoctorListGridView.SelectedRow.FindControl("lblDoctorID") as Label).Text;
            if (e.CommandArgument.Equals("View"))
            {
                txtFirstnameV.Text = (DoctorListGridView.SelectedRow.FindControl("lblFirstName") as Label).Text;
                txtLastnameV.Text = (DoctorListGridView.SelectedRow.FindControl("lblLastName") as Label).Text;
                txtKinPhoneV.Text = (DoctorListGridView.SelectedRow.FindControl("lblPhoneNumber") as Label).Text;
                txtGenderV.Text = (DoctorListGridView.SelectedRow.FindControl("lblGender") as Label).Text;
                txtAddressV.Text = (DoctorListGridView.SelectedRow.FindControl("lblAddress") as Label).Text;

                //HideDivs
                HideDivsDocTab();
                ViewDoctorDiv.Visible = true;
            }
            else if(e.CommandArgument.Equals("Edit"))
            {
                txtFirstnameE.Text = (DoctorListGridView.SelectedRow.FindControl("lblFirstName") as Label).Text;
                txtLastnameE.Text = (DoctorListGridView.SelectedRow.FindControl("lblLastName") as Label).Text;
                txtKinPhoneE.Text = (DoctorListGridView.SelectedRow.FindControl("lblPhoneNumber") as Label).Text;
                ddlGenderE.SelectedValue = (DoctorListGridView.SelectedRow.FindControl("lblGender") as Label).Text;
                txtAddressE.Text = (DoctorListGridView.SelectedRow.FindControl("lblAddress") as Label).Text;

                //HideDivs
                HideDivsDocTab();
                EditDoctorDiv.Visible = true;
            }
            else
            {
                //Delete
                Doctor docDelete = context.Doctors.FirstOrDefault(doc => doc.DoctorID == int.Parse(itemID));
                context.Doctors.Remove(docDelete);
                //Bind Data to Grid
                BindGrid();
                SxsMessage("Doctor removed");
            }
        }
        catch (Exception)
        {

            throw;
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
            Doctor doc = new Doctor()
            {
                FirstName = txtFirstname.Text.Trim(),
                LastName = txtLastname.Text.Trim(),
                OtherNames = txtOthername.Text.Trim(),
                Gender = ddlGender.SelectedItem.Text.Trim(),
                PhoneNumber = txtPhone.Text.Trim(),
                Address = txtAddress.Text.Trim(),
                DOB = Convert.ToDateTime(txtDOB.Text).Date,
            };
            context.Doctors.Add(doc);
            context.Entry(doc).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();

            //Bind to Grid
            BindGrid();
            HideDivsDocTab();
            ViewDoctorListDiv.Visible = true;
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
        ResponseAlert.NoteType = "Success";
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
            var data = from d in context.Doctors
                       select d;
            DoctorListGridView.DataSource = data;
            DoctorListGridView.DataBind();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion

}