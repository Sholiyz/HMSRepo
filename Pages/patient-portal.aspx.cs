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

        //Call Pop up Alert

        Alert.CallAlert(Alert.Alerttype.warning.ToString(), "Check and try again.");

        //Alert.CallAlert(Alert.Alerttype.error.ToString(), "Operation can not be done.");
        //return;
    }

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

    #region Manage MenuNav
    private void SetActiveContainerVisible(string NavtabName)
    {
        if (NavtabName.ToLower() == "patient")
        {
            HideContentView();
            patientli.Attributes["class"] = "active";
            patient.Visible = true;
            patient.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "familyplan")
        {
            HideContentView();
            familyplanli.Attributes["class"] = "active";
            familyplan.Visible = true;
            familyplan.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "consultation")
        {
            HideContentView();
            consultationli.Attributes["class"] = "active";
            consultation.Visible = true;
            consultation.Attributes["class"] = "tab-pane fade active in";
            return;
        }
        if (NavtabName.ToLower() == "vitalsign")
        {
            HideContentView();
            vitalsignli.Attributes["class"] = "active";
            vitalsign.Visible = true;
            vitalsign.Attributes["class"] = "tab-pane fade active in";
            return;
        }

    }
    private void HideContentView()
    {
        patient.Visible = false;
        patientli.Attributes["class"] = "";

        familyplan.Visible = false;
        familyplanli.Attributes["class"] = "";

        consultation.Visible = false;
        consultationli.Attributes["class"] = "";

        vitalsign.Visible = false;
        vitalsignli.Attributes["class"] = "";

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
            SetActiveContainerVisible("patient");
            HidePatientViews();
            ViewPatientListDiv.Visible = true;
            BindPatientList();
            return;
        }
        if (rolename.ToLower().Contains("nurse"))
        {
            HideAllMenuNav();
            patientsportal.Visible = true;
            nursesportal.Visible = true;
            SetActiveContainerVisible("patient");
            return;
        }
        if (rolename.ToLower().Contains("doctor"))
        {
            HideAllMenuNav();
            patientsportal.Visible = true;
            doctorsportal.Visible = true;
            SetActiveContainerVisible("patient");
            return;
        }
        else
        {
            HideAllMenuNav();
        }

    }


    #endregion

    #region Manage Page View
    private void SetDefualtView()
    {
        SetActiveContainerVisible("patient");
        HidePatientViews();
        ViewPatientListDiv.Visible = true;
        BindPatientList();
    }

    protected void PatientDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("patient");
        HidePatientViews();
        ViewPatientListDiv.Visible = true;
        BindPatientList();
    }

    protected void FamilyPlanDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("familyplan");
        HideFamilyPlanViews();
        ViewPatientWithFamilyPlanListDiv.Visible = true;
        BindPatientsWithFamilyList();
    }

    protected void ConsultationDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("consultation");
        HideConsultationViews();
        AddNewConsultationDiv.Visible = true;
    }

    protected void VitalSignDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("vitalsign");
        HideVitalSignViews();
        AddNewVitalSignDiv.Visible = true;
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

    #region Populate DroupDownList
    //Addpatientplantypelistddl
    private void PopulatePatientPlanTypelist(DropDownList ddlistname)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetPatientPlans();
        ddlistname.DataTextField = "PlanTypeName";
        ddlistname.DataValueField = "PlanTypeID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Patient Plan type...", "-1"));
    }
    private void PopulatePatientList(DropDownList ddlistname)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetPatientPlans();
        ddlistname.DataTextField = "FullName";
        ddlistname.DataValueField = "PatientID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Patient ...", "-1"));
    }
    private void PopulatePatientFMList(DropDownList ddlistname,int PatientId)
    {
        //Employee role = new Employee();
        ddlistname.DataSource = Pasture.GetFamilyMembersListByPatientID(PatientId);
        ddlistname.DataTextField = "FullName";
        ddlistname.DataValueField = "FamilyMemberID";
        ddlistname.DataBind();
        ddlistname.Items.Insert(0, new ListItem("Select Family Member...", "-1"));
    }

    #endregion

    #region Binding

    private void BindPatientList()
    {
        PatientListGridView.DataSource = Pasture.GetPatients();
        PatientListGridView.DataBind();
    }
    private void BindPatientsWithFamilyList()
    {
        PatientWithFamilyPlanListGridView.DataSource = Pasture.GetPatientsWithFamilyPlan();
        PatientWithFamilyPlanListGridView.DataBind();
    }

    private void BindConsultationList()
    {
        ConsultationListGridView.DataSource = Pasture.GetConsultations();
        ConsultationListGridView.DataBind();
    }

    private void BindVitalSignList()
    {
        VitalSignListGridView.DataSource = Pasture.GetVitalSigns();
        VitalSignListGridView.DataBind();
    }

    #endregion

    #region Patient
    private void HidePatientViews()
    {
        AddNewPatientDiv.Visible = false;
        ViewPatientListDiv.Visible = false;
        ViewPatientDiv.Visible = false;
        EditPatientDiv.Visible = false;
        AddPatientVitalSignDiv.Visible = false;
    }
    #endregion

    #region Family Member Plan
    private void HideFamilyPlanViews()
    {
        AddNewPatientFamilyMemberDiv.Visible = false;
        ViewPatientFamilyMemberListDiv.Visible = false;
        ViewPatientFamilyMemberDiv.Visible = false;
        EditPatientFamilyMemberDiv.Visible = false;
        AddPatientFamilyMemberVitalSignDiv.Visible = false;

    }
    #endregion

    #region Consultation
    private void HideConsultationViews()
    {
        AddNewConsultationDiv.Visible = false;
        ViewConsultaionListDiv.Visible = false;
        ViewConsultationDiv.Visible = false;
        EditConsultationDiv.Visible = false;
    }

    #endregion

    #region Vital Sign

    protected void AddNewVitalSignViewlistButton_Click(object sender, EventArgs e)
    {
        HideVitalSignViews();
        BindVitalSignList();
        ViewVitalSignListDiv.Visible = true;
    }
    protected void AddNewVitalSignProceedButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (AddNewVitalSignPatientDDL.SelectedValue != "-1")
            {
                ShowErrorResponse("Select patient try again!!");
                return;
            }

                VitalSign newVitalSign = new VitalSign()
            {
                PatientID = Convert.ToInt32(AddNewVitalSignPatientDDL.SelectedValue.ToString()),
                Temprature = Convert.ToDecimal(EditVitalSignTemprature.Text),
                Pulse = Convert.ToDecimal(EditVitalSignPulse.Text),
                Respiration = Convert.ToDecimal(EditVitalSignRespiration.Text),
                BloodPressure = Convert.ToDecimal(EditVitalSignBloodPressure.Text),
                Weight = Convert.ToDecimal(EditVitalSignWeight.Text),
                Height = Convert.ToDecimal(EditVitalSignHeight.Text)

            };
            if (AddNewVitalSignPatientFamilyMemberDiv.Visible == true)
            {
                newVitalSign.FMPatientID = Convert.ToInt32(AddNewVitalSignPatientFamilyMemberDDL.SelectedValue.ToString());
            }


            int response = Pasture.AddNewVitalSign(newVitalSign);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Vital Sign successfly submited!!");

            }
            else
            {
                ShowErrorResponse("Vital Sign not submited kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Vital Sign not submited kindly contact admin.");
        }
    }
    protected void ViewVitalSignAddNewVitalSignButton_Click(object sender, EventArgs e)
    {
        HideVitalSignViews();
        BindVitalSignList();
        AddNewVitalSignDiv.Visible = true;
    }
    protected void ViewVitalSignBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int vitalsignid = Convert.ToInt32((btn.CommandArgument.ToString()));
            VitalSign vitalsign = Pasture.GetVitalSignByID(vitalsignid);
            ViewVitalSignPatientFullname.Text = Pasture.GetVitalSignPatientByID(vitalsignid);
            ViewVitalSignRespiration.Text = vitalsign.Temprature.ToString();
            ViewVitalSignPulse.Text = vitalsign.Pulse.ToString();
            ViewVitalSignRespiration.Text = vitalsign.Respiration.ToString();
            ViewVitalSignBloodPressure.Text = vitalsign.BloodPressure.ToString();
            ViewVitalSignWeight.Text = vitalsign.Weight.ToString();
            ViewVitalSignHeight.Text = vitalsign.Height.ToString();

            //SelectedValue = viewUser.StaffRoleID.ToString();

            HideVitalSignViews();
            ViewVitalSignDiv.Visible = true;



        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditVitalSignBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int vitalsignid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Session["CurrentEditVitalSignID"] = vitalsignid;
            VitalSign vitalsign = Pasture.GetVitalSignByID(vitalsignid);
            EditVitalSignPatientName.Text = Pasture.GetVitalSignPatientByID(vitalsignid);
            EditVitalSignRespiration.Text = vitalsign.Temprature.ToString();
            EditVitalSignPulse.Text = vitalsign.Pulse.ToString();
            EditVitalSignRespiration.Text = vitalsign.Respiration.ToString();
            EditVitalSignBloodPressure.Text = vitalsign.BloodPressure.ToString();
            EditVitalSignWeight.Text = vitalsign.Weight.ToString();
            EditVitalSignHeight.Text = vitalsign.Height.ToString();

            //SelectedValue = viewUser.StaffRoleID.ToString();

            HideVitalSignViews();
            EditVitalSignDiv.Visible = true;



        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void EditVitalSignBackButton_Click(object sender, EventArgs e)
    {
        HideVitalSignViews();
        BindVitalSignList();
        ViewVitalSignListDiv.Visible = true;
    }
    protected void EditVitalSignUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {
            VitalSign updateVitalSign = new VitalSign()
            {
                ID = (int)Session["CurrentEditVitalSignID"],
                Temprature = Convert.ToDecimal(EditVitalSignTemprature.Text),
                Pulse = Convert.ToDecimal(EditVitalSignPulse.Text),
                Respiration = Convert.ToDecimal(EditVitalSignRespiration.Text),
                BloodPressure = Convert.ToDecimal(EditVitalSignBloodPressure.Text),
                Weight = Convert.ToDecimal(EditVitalSignWeight.Text),
                Height = Convert.ToDecimal(EditVitalSignHeight.Text)

            };


            int response = Pasture.UpdateVitalSign(updateVitalSign);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Vital Sign successfly updated!!");
                Session["CurrentEditVitalSignID"] = null;
            }
            else
            {
                ShowErrorResponse("Vital Sign not updated kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Vital Sign not updated kindly contact the admin.");
        }
    }
    protected void ViewVitalSignBackButton_Click(object sender, EventArgs e)
    {
        HideVitalSignViews();
        BindVitalSignList();
        ViewVitalSignListDiv.Visible = true;
    }
    private void HideVitalSignViews()
    {
        AddNewVitalSignDiv.Visible = false;
        ViewVitalSignListDiv.Visible = false;
        ViewVitalSignDiv.Visible = false;
        EditVitalSignDiv.Visible = false;
    }
    protected void AddNewVitalSignPatientDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(AddNewVitalSignPatientDDL.SelectedValue != "-1")
        {
            int patientid = Convert.ToInt32(AddNewVitalSignPatientDDL.SelectedValue.ToString());
            int VerifyPatientPlan = Pasture.VerifyPatientPlanByID(patientid);
            if (VerifyPatientPlan > 1)
            {
                AddNewVitalSignPatientFamilyMemberDiv.Visible = true;
                PopulatePatientFMList(AddNewVitalSignPatientFamilyMemberDDL, patientid);
            }
        }
        
    }

    #endregion Vital Sign





}