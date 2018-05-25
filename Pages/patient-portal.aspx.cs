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
            dashboard.Visible = true;
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
        BindConsultationList();
        ViewConsultaionListDiv.Visible = true;
    }

    protected void VitalSignDivNav_Click(object sender, EventArgs e)
    {
        SetActiveContainerVisible("vitalsign");
        HideVitalSignViews();
        PopulatePatientList(AddNewVitalSignPatientDDL);
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
        ddlistname.DataSource = Pasture.GetPatients();
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

    private void BindFamilyMemberList(int patientid)
    {
        PatientFamilyMemberListGridView.DataSource = Pasture.GetFamilyMembersListByPatientID(patientid);
        PatientFamilyMemberListGridView.DataBind();
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

    #region ImageHelper
    //Add Image
    private byte[] GetImageForUpload(FileUpload FileUploader)
    {
        Byte[] imgbyte=new byte[]{0};
        if (FileUploader.HasFile)
        {
            HttpPostedFile file = FileUploader.PostedFile;
            imgbyte = new Byte[file.ContentLength];
            file.InputStream.Read(imgbyte, 0, file.ContentLength);
            return imgbyte;
        }
        return imgbyte;   
    }

    private string GetImageFileForView(byte[] image)
    {
        if(image != null)
        {
            byte[] bytes = (byte[])image;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            //string ImageString = "data:image/png;base64," + base64String;
            return base64String;
        }
        return null;
    }

    #endregion

  
    #region Vital Sign
    private void ClearVitalSignFields()
    { 
       AddNewVitalSignPatientDDL.SelectedValue="-1";
               AddNewVitalSignTemprature.Text =string.Empty;
               AddNewVitalSignPulse.Text =string.Empty;
                AddNewVitalSignRespiration.Text =string.Empty;
                AddNewVitalSignBloodPressure.Text =string.Empty;
                AddNewVitalSignWeight.Text=string.Empty;
             AddNewVitalSignHeight.Text=string.Empty;
        EditVitalSignTemprature.Text =string.Empty;
              EditVitalSignPulse.Text =string.Empty;
               EditVitalSignRespiration.Text =string.Empty;
               EditVitalSignBloodPressure.Text =string.Empty;
               EditVitalSignWeight.Text =string.Empty;
                EditVitalSignHeight.Text =string.Empty;
    }
    protected void AddNewVitalSignViewlistButton_Click(object sender, EventArgs e)
    {
        HideVitalSignViews();
        PopulatePatientList(AddNewVitalSignPatientDDL);
        BindVitalSignList();
        ViewVitalSignListDiv.Visible = true;
    }

    protected void AddNewVitalSignProceedButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (AddNewVitalSignPatientDDL.SelectedValue == "-1")
            {
                ShowErrorResponse("Select patient try again!!");
                return;
            }

            VitalSign newVitalSign = new VitalSign()
            {
                PatientID = Convert.ToInt32(AddNewVitalSignPatientDDL.SelectedValue.ToString()),
                Temprature = Convert.ToDecimal(AddNewVitalSignTemprature.Text.ToString()),
                Pulse = Convert.ToDecimal(AddNewVitalSignPulse.Text.ToString()),
                Respiration = Convert.ToDecimal(AddNewVitalSignRespiration.Text.ToString()),
                BloodPressure = Convert.ToDecimal(AddNewVitalSignBloodPressure.Text.ToString()),
                Weight = Convert.ToDecimal(AddNewVitalSignWeight.Text.ToString()),
                Height = Convert.ToDecimal(AddNewVitalSignHeight.Text.ToString())

            };
            if (AddNewVitalSignPatientFamilyMemberDiv.Visible == true && AddNewVitalSignPatientFamilyMemberDDL.SelectedValue.ToString()!="-1")
            {
                newVitalSign.FMPatientID = Convert.ToInt32(AddNewVitalSignPatientFamilyMemberDDL.SelectedValue.ToString());
            }


            int response = Pasture.AddNewVitalSign(newVitalSign);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Vital Sign successfly submited!!");
                ClearVitalSignFields();
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
            ViewVitalSignTemprature.Text = vitalsign.Temprature.ToString();
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
            EditVitalSignTemprature.Text = vitalsign.Temprature.ToString();
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
                ClearVitalSignFields();
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
        if (AddNewVitalSignPatientDDL.SelectedValue != "-1")
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

    #endregion
        
    #region Patient

    protected void AddNewPatientProceedButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (Addpatientplantypelistddl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select Patient Plan try again!!");
                return;
            }
            if (AddNewPatientGenderDDl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select Gender try again!!");
                return;
            }
            if (AddNewPatientMaritalStatusddl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select Marital status try again!!");
                return;
            }

            Patient newPatient = new Patient()
            {
                FirstName = AddNewPatientFirtnameTxtBox.Text,
                LastName = AddNewPatientLastNameTxtBox.Text,
                OtherNames = AddNewPatientOtherNamesTxtBox.Text,
                PlanTypeID = Convert.ToInt32(Addpatientplantypelistddl.SelectedValue.ToString()),
                Gender = AddNewPatientGenderDDl.SelectedItem.Text,
                Occupation=AddNewPatientOccupationTxtBox.Text,
                MaritalStatus = AddNewPatientMaritalStatusddl.SelectedItem.Text,
                PhoneNumber = AddNewPatientPhoneNumberTxtBox.Text,
                Address = AddNewPatientAddressTxtBox.Text,
                DOB = Convert.ToDateTime(AddNewPatientDOBTxtBox.Text),
                NextofKinFullName= AddNewPatientNOKFullNameTxtBox.Text,
                NextofKinPhoneNumber= AddNewPatientNOKPhoneNumberTxtBox.Text,
                Picture= GetImageForUpload(AddNewPatientPictureUpload)

            };
            


            int response = Pasture.AddNewPatient(newPatient);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Patient successfly created!!");
                PatientIDforVitalSign.Value = newPatient.PatientID.ToString();
                Session["PatientIDforVitalSign"] = newPatient.PatientID.ToString();
                HidePatientViews();
                BindPatientList();
                AddPatientVitalSignDiv.Visible = true;
            }
            else
            {
                ShowErrorResponse("Patient not created kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Patient not created kindly contact admin.");
        }
    }

    protected void AddNewPatientBackButton_Click(object sender, EventArgs e)
    {
        HidePatientViews();
        ViewPatientListDiv.Visible = true;
    }

    protected void ViewPatientListAddNewPatietButton_Click(object sender, EventArgs e)
    {
        HidePatientViews();
        PopulatePatientPlanTypelist(Addpatientplantypelistddl);
        AddNewPatientDiv.Visible = true;
    }

    protected void ViewPatientListBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int patientid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Patient patient = Pasture.GetPatientByID(patientid);

            ViewPatientFirstNameTxtBox.Text = patient.FirstName;
            ViewPatientLastNameTxtBox.Text = patient.LastName;
            ViewPatientOtherNamesTxtBox.Text = patient.OtherNames;
            ViewPatientPlanTxtBox.Text =Pasture.GetPatientPlanNameByID( patient.PlanTypeID);
            ViewPatientGenderTxtBox.Text = patient.Gender;
            ViewPatientOccupationTxtBox.Text = patient.Occupation;
            ViewPatientMaritalStatusTxtBox.Text = patient.MaritalStatus;
            ViewPatientPhoneNumberTxtBox.Text = patient.PhoneNumber;
            ViewPatientAddressTxtBox.Text = patient.Address;
            ViewPatientDOBTxtBox.Text = patient.DOB.ToString();
            ViewPatientNOKFullNAmeTxtBox.Text = patient.NextofKinFullName;
            ViewPatientNOKPhoneNumberTxtBox.Text = patient.NextofKinPhoneNumber;


            string ImageUrl = GetImageFileForView(patient.Picture);
            ViewPatientmageViewer.ImageUrl = "data:image/png;base64," + ImageUrl;

            HidePatientViews();
            ViewPatientDiv.Visible = true;

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void EditPatientListBtn_Click(object sender, EventArgs e)
    {
        try
        {
            PopulatePatientPlanTypelist(Editpatientplantypelistddl);
            Button btn = (Button)sender;
            int patientid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Session["CurrentEditPatientID"] = patientid;
            Patient patient = Pasture.GetPatientByID(patientid);
            EditPatientFirstNameTxtBox.Text = patient.FirstName;
            EditPatientLastNameTxtBox.Text = patient.LastName;
            EditPatientOtherNamesTxtBox.Text = patient.OtherNames;
            Editpatientplantypelistddl.SelectedValue = patient.PlanTypeID.ToString();
            //EditPatientGenderddl.SelectedItem.Text = patient.Gender;
            EditPatientOccupationTxtBox.Text = patient.Occupation;
            //EditPatientMaritalStatusddl.SelectedItem.Text = patient.MaritalStatus;
            EditPatientPhoneNumberTxtBox.Text = patient.PhoneNumber;
            EditPatientAddressTxtBox.Text = patient.Address;
            EditPatientDOBTxtBox.Text = patient.DOB.ToString();
            EditPatientNOKFullNameTxtBox.Text = patient.NextofKinFullName;
            EditPatientNOKPhoneNumberTxtBox.Text = patient.NextofKinPhoneNumber;

            string ImageUrl = GetImageFileForView(patient.Picture);
            EditPatientImageViewer.ImageUrl = "data:image/png;base64," + ImageUrl;

            HidePatientViews();
            
            EditPatientDiv.Visible = true;



        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void PatientActivatioButton_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int patientid = Convert.ToInt32((btn.CommandArgument.ToString()));
            bool ActivateState;
            int response = Pasture.ActivateOrDeactivatePatient(patientid, out ActivateState);

            if (response > 0)
            {
                if (ActivateState)
                {
                    PastureAlert.PopSuccessAlert("Patient Successfly Activated!!");
                }
                else
                {
                    PastureAlert.PopSuccessAlert("Patient Successfly Deactivated!!");
                }
                try
                {
                    HidePatientViews();
                    ViewPatientListDiv.Visible = true;
                    BindPatientList();

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
    protected void ViewPatientBackButton_Click(object sender, EventArgs e)
    {
        HidePatientViews();
        BindPatientList();
        ViewPatientListDiv.Visible = true;
    }
    protected void EditPatientBackButton_Click(object sender, EventArgs e)
    {
        HidePatientViews();
        BindPatientList();
        ViewPatientListDiv.Visible = true;
    }

    protected void EditPatientUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {
            
           if (Editpatientplantypelistddl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select Patient Plan try again!!");
                return;
            }
            if (EditPatientGenderddl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select Gender try again!!");
                return;
            }
            if (EditPatientDOBTxtBox.Text == string.Empty)
            {
                ShowErrorResponse("Birth Date not selected, try again!!");
                return;
            }
            if (EditPatientMaritalStatusddl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select MArital status try again!!");
                return;
            }
            int updatepatientid = (int)Session["CurrentEditPatientID"];
            Patient updatePatient = new Patient()
            {
                PatientID = updatepatientid,
                FirstName = EditPatientFirstNameTxtBox.Text,
                LastName = EditPatientLastNameTxtBox.Text,
                OtherNames = EditPatientOtherNamesTxtBox.Text,
                PlanTypeID = Convert.ToInt32(Editpatientplantypelistddl.SelectedValue.ToString()),
                Gender = EditPatientGenderddl.SelectedItem.Text,
                Occupation= EditPatientOccupationTxtBox.Text,
                MaritalStatus = EditPatientMaritalStatusddl.SelectedItem.Text,
                PhoneNumber = EditPatientPhoneNumberTxtBox.Text,
                Address = EditPatientAddressTxtBox.Text,
                DOB = Convert.ToDateTime(EditPatientDOBTxtBox.Text),
                NextofKinFullName = EditPatientNOKFullNameTxtBox.Text,
                NextofKinPhoneNumber = EditPatientNOKPhoneNumberTxtBox.Text,
                Picture = GetImageForUpload(EditPatientPassportFileupload)

            };



            int response = Pasture.UpdatePatient(updatePatient);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Patient successfly updated!!");

            }
            else
            {
                ShowErrorResponse("Patient not updated kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Patient not updated kindly contact admin.");
        }
    }

    protected void AddPatientVitalSignProceedButton_Click(object sender, EventArgs e)
    {

        try
        {
            int patientid = (int)Session["PatientIDforVitalSign"];
            if (patientid == 0 || patientid.ToString() == null)
            {
                PastureAlert.PopWarningAlert("This process has being delayed for too long, kindly add from vital sign section!!");
                HidePatientViews();
                BindPatientList();
                ViewPatientListDiv.Visible = true;
                return;
            }
            if (AddNewVitalSignPatientDDL.SelectedValue != "-1")
            {
                ShowErrorResponse("Select patient try again!!");
                return;
            }
           // int patientid = Convert.ToInt32(PatientIDforVitalSign.Value);
            //int patientid =(int) Session["PatientIDforVitalSign"];
            VitalSign newVitalSign = new VitalSign()
            {
                PatientID = patientid,// Convert.ToInt32(AddNewVitalSignPatientDDL.SelectedValue.ToString()),
                Temprature = Convert.ToDecimal(AddPatientVitalSignTemprature.Text),
                Pulse = Convert.ToDecimal(AddPatientVitalSignPulse.Text),
                Respiration = Convert.ToDecimal(AddPatientVitalSignRespiration.Text),
                BloodPressure = Convert.ToDecimal(AddPatientVitalSignBloodPressure.Text),
                Weight = Convert.ToDecimal(AddPatientVitalSignWeight.Text),
                Height = Convert.ToDecimal(AddPatientVitalSignHeight.Text)

            };           


            int response = Pasture.AddNewVitalSign(newVitalSign);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Vital Sign successfly submited!!");
                HidePatientViews();
                BindPatientList();
                ViewPatientListDiv.Visible = true;
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


    private void AddFMClearVitalSignFields()
    {
        AddPatientFamilyMemberVitalSignTempratureTxtBox.Text = string.Empty;
         AddPatientFamilyMemberVitalSignPulseTxtBox.Text = string.Empty;
       AddPatientFamilyMemberVitalSignRespirationTxtBox.Text = string.Empty;
        AddPatientFamilyMemberVitalSignBloodPressureTxtBox.Text = string.Empty;
       AddPatientFamilyMemberVitalSignWeightTxtBox.Text = string.Empty;
        AddPatientFamilyMemberVitalSignHeightTxtBox.Text = string.Empty;
    }

    private void ClearAddFMFields()
    {
        AddNewPatientFamilyMemberFirstNametxtBox.Text = string.Empty;
        AddNewPatientFamilyMemberLastNameTxtBox.Text = string.Empty;
        AddNewPatientFamilyMemberOTHERNAMESTxtBox.Text = string.Empty;
        AddNewPatientFamilyMemberGenderddl.SelectedItem.Text = string.Empty;
        AddNewPatientFamilyMemberPhoneNumberTxtBox.Text = string.Empty;
        AddNewPatientFamilyMemberAddressTxtBox.Text = string.Empty;
        AddNewPatientFamilyMemberDOBTxtBox.Text = string.Empty;
    }
    protected void ViewPatientWithFamilyPlanListBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int patientid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Patient patient = Pasture.GetPatientByID(patientid);
            Session["CurrentPatientIDViewingMember"] = patientid;

            HideFamilyPlanViews();
            BindFamilyMemberList(patientid);
            ViewPatientFamilyMemberListDiv.Visible = true;

        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void AddViewPatientWithFamilyPlanListBtn_Click(object sender, EventArgs e)
    {
        //Sends Patient ID to Add New FM

        try
        {
            Button btn = (Button)sender;
            int patientid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Patient patient = Pasture.GetPatientByID(patientid);
            Session["CurrentPatientIDViewingMember"] = patientid;

            AddNewPatientFamilyMemberRelatedPatientFullNameTxtBox.Text=Pasture.GetPatientFullNameByID(patientid);
            HideFamilyPlanViews();
            AddNewPatientFamilyMemberDiv.Visible = true;

        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void AddNewPatientFamilyMemberTxtBoxBackButton_Click(object sender, EventArgs e)
    {
        HideFamilyPlanViews();
        BindPatientsWithFamilyList();
        int patientRLtVID = (int)Session["CurrentPatientIDViewingMember"];
        AddNewPatientFamilyMemberRelatedPatientFullNameTxtBox.Text = Pasture.GetPatientFullNameByID(patientRLtVID);
        ViewPatientWithFamilyPlanListDiv.Visible = true;
    }

    protected void AddNewPatientFamilyMemberTxtBoxProceedButton_Click(object sender, EventArgs e)
    {
        try
        {
            int patientid = (int)Session["CurrentPatientIDViewingMember"];
            if( patientid == 0 || patientid.ToString() == null)
            {
                PastureAlert.PopWarningAlert("This process has being delayed for too long, kindly select patient again!!");
                HideFamilyPlanViews();
                BindPatientsWithFamilyList();
                ViewPatientWithFamilyPlanListDiv.Visible = true;
                return;
            }
            if (AddNewPatientFamilyMemberGenderddl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select Gender try again!!");
                return;
            }           

            FamilyMember newFamilyMember = new FamilyMember()
            {
                PatientID= patientid,
                FirstName = AddNewPatientFamilyMemberFirstNametxtBox.Text,
                LastName = AddNewPatientFamilyMemberLastNameTxtBox.Text,
                OtherNames = AddNewPatientFamilyMemberOTHERNAMESTxtBox.Text,                
                Gender = AddNewPatientFamilyMemberGenderddl.SelectedItem.Text,
                PhoneNumber = AddNewPatientFamilyMemberPhoneNumberTxtBox.Text,
                Address = AddNewPatientFamilyMemberAddressTxtBox.Text,
                DOB = Convert.ToDateTime(AddNewPatientFamilyMemberDOBTxtBox.Text),                
                Picture = GetImageForUpload(AddNewPatientFamilyMemberPassportFileUpload)

            };



            int response = Pasture.AddNewFamilyMember(newFamilyMember);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Patient Family Member successfly created!!");
                //PatientIDforVitalSign.Value = newFamilyMember.PatientID.ToString();
                Session["PatientFMIDforVitalSign"] = newFamilyMember.PatientID;
                Session["PatientFMIDforVitalSignFamilyMembrID"] = newFamilyMember.FamilyMemberID;
                HideFamilyPlanViews();
                BindFamilyMemberList(patientid);
                
                AddPatientFamilyMemberVitalSignDiv.Visible = true;
            }
            else
            {
                ShowErrorResponse("Patient Family Member not created kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Patient Family Member not created kindly contact admin.");
        }
    }

    protected void ViewPatientFamilyMemberAddFamilyMemberButton_Click(object sender, EventArgs e)
    {
        try
        {
           
            int patientid = (int)Session["CurrentPatientIDViewingMember"];
            Session["CurrentPatientIDViewingMember"] = Session["CurrentPatientIDViewingMember"];
            int patientRLtVID = (int)Session["CurrentPatientIDViewingMember"];
            AddNewPatientFamilyMemberRelatedPatientFullNameTxtBox.Text = Pasture.GetPatientFullNameByID(patientRLtVID);
            HideFamilyPlanViews();
            AddNewPatientFamilyMemberDiv.Visible = true;

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void PatientFamilyMemberListViewBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int patientid = Convert.ToInt32((btn.CommandArgument.ToString()));
            FamilyMember patient = Pasture.GetFamilyMemberByID(patientid);

            ViewPatientFamilyMemberRelatedPatientFullnameTxtBox.Text = Pasture.GetPatientFullNameByID(patient.PatientID);
            ViewPatientFamilyMemberFirstNameTxtBox.Text = patient.FirstName;
            ViewPatientFamilyMemberLastNameTxtBox.Text = patient.LastName;
            ViewPatientFamilyMemberOthernamesTxtBox.Text = patient.OtherNames;

            ViewPatientFamilyMemberGenderTxtBox.Text = patient.Gender;

            ViewPatientFamilyMemberPhoneNumberTxtBox.Text = patient.PhoneNumber;
            ViewPatientFamilyMemberAddressTxtBox.Text = patient.Address;
            ViewPatientFamilyMemberDOBTxtBox.Text = patient.DOB.ToString();          


            string ImageUrl = GetImageFileForView(patient.Picture);
            ViewPatientFamilyMemberImageViewer.ImageUrl = "data:image/png;base64," + ImageUrl;

            HideFamilyPlanViews();
            ViewPatientFamilyMemberDiv.Visible = true;

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void PatientFamilyMemberListEdittn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int patientid = Convert.ToInt32((btn.CommandArgument.ToString()));
            FamilyMember patient = Pasture.GetFamilyMemberByID(patientid);
            Session["EditFamilyMemderID"] = patientid;
            EditPatientFamilyMemberRelatedPatientfullnameTxtBox.Text = Pasture.GetPatientFullNameByID(patient.PatientID);
            EditPatientFamilyMemberFirstNameTxtBox.Text = patient.FirstName;
            EditPatientFamilyMemberLastNameTxtBox.Text = patient.LastName;
            EditPatientFamilyMemberOtherNameTxtBox.Text = patient.OtherNames;
            EditPatientFamilyMemberGenderTxtBox.SelectedItem.Text = patient.Gender;
            EditPatientFamilyMemberPhoneNumberTxtBox.Text = patient.PhoneNumber;
            EditPatientFamilyMemberAddressTxtBox.Text = patient.Address;
            EditPatientFamilyMemberDOBTxtBox.Text = patient.DOB.ToString();


            string ImageUrl = GetImageFileForView(patient.Picture);
            EditPatientFamilyMemberImageViewer.ImageUrl = "data:image/png;base64," + ImageUrl;

            HideFamilyPlanViews();
            EditPatientFamilyMemberDiv.Visible = true;

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void PatientFamilyMemberListDeleteBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int patientfmid = Convert.ToInt32((btn.CommandArgument.ToString()));
            int response = Pasture.DeleteFamilyMemberByID(patientfmid);
            if (response > 0)
            {
                PastureAlert.PopSuccessAlert("Patient Successfly Deleted!!");

                try
                {
                    HideFamilyPlanViews();
                    int patientid = (int) Session["CurrentPatientIDViewingMember"];
                    BindFamilyMemberList(patientid);
                    ViewPatientFamilyMemberListDiv.Visible = true;

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

    protected void EditPatientFamilyMemberBackButton_Click(object sender, EventArgs e)
    {
        HideFamilyPlanViews();
        int patientid = (int)Session["CurrentPatientIDViewingMember"];
        if (patientid == 0 || patientid.ToString() == null)
        {
            
            HideFamilyPlanViews();
            BindPatientsWithFamilyList();
            ViewPatientWithFamilyPlanListDiv.Visible = true;
            return;
        }
        BindFamilyMemberList(patientid);
        ViewPatientFamilyMemberListDiv.Visible = true;
    }

    protected void EditPatientFamilyMemberUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (EditPatientFamilyMemberDOBTxtBox.Text == string.Empty)
            {
                ShowErrorResponse("Birth Date not selected, try again!!");
                return;
            }
            int patientid = (int)Session["EditFamilyMemderID"];
            if (patientid == 0 || patientid.ToString() == null)
            {
                PastureAlert.PopWarningAlert("This process has being delayed for too long, kindly select patient again!!");
                HideFamilyPlanViews();
                BindPatientsWithFamilyList();
                ViewPatientWithFamilyPlanListDiv.Visible = true;
                return;
            }
            if (AddNewPatientFamilyMemberGenderddl.SelectedValue != "-1")
            {
                ShowErrorResponse("Select Gender try again!!");
                return;
            }
            
            FamilyMember updateFamilyMember = new FamilyMember()
            {
                FamilyMemberID = patientid,
                FirstName = EditPatientFamilyMemberFirstNameTxtBox.Text,
                LastName = EditPatientFamilyMemberLastNameTxtBox.Text,
                OtherNames = EditPatientFamilyMemberOtherNameTxtBox.Text,
                Gender = EditPatientFamilyMemberGenderTxtBox.SelectedItem.Text,
                PhoneNumber = EditPatientFamilyMemberPhoneNumberTxtBox.Text,
                Address = EditPatientFamilyMemberAddressTxtBox.Text,
                DOB = Convert.ToDateTime(EditPatientFamilyMemberDOBTxtBox.Text),
                Picture = GetImageForUpload(EditPatientFamilyMemberPassportFileupload)

            };


            int relatedpatientid = 0;
            int response = Pasture.UpdateFamilyMember(updateFamilyMember,out relatedpatientid);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Patient Family Member successfly updated!!");
                //PatientIDforVitalSign.Value = newFamilyMember.PatientID.ToString();
                Session["PatientFMIDforVitalSign"] = updateFamilyMember.PatientID;
                HideFamilyPlanViews();
                BindFamilyMemberList(relatedpatientid);

                ViewPatientFamilyMemberListDiv.Visible = true;
            }
            else
            {
                ShowErrorResponse("Patient Family Member not updated kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Patient Family Member not updated kindly contact admin.");
        }
    }

    protected void ViewPatientFamilyMemberBackButton_Click(object sender, EventArgs e)
    {
        HideFamilyPlanViews();
        int patientid = (int)Session["CurrentPatientIDViewingMember"];
        if (patientid == 0 || patientid.ToString() == null)
        {

            HideFamilyPlanViews();
            BindPatientsWithFamilyList();
            ViewPatientWithFamilyPlanListDiv.Visible = true;
            return;
        }
        BindFamilyMemberList(patientid);
        ViewPatientFamilyMemberListDiv.Visible = true;
    }

    protected void AddPatientFamilyMemberVitalSignProceedButton_Click(object sender, EventArgs e)
    {
        try
        {
            int patientid = (int) Session["PatientFMIDforVitalSign"];
            int familyMemberid= (int) Session["PatientFMIDforVitalSignFamilyMembrID"];
            if (patientid == 0 || patientid.ToString() == null)
            {
                PastureAlert.PopWarningAlert("This process has being delayed for too long, kindly add from vital sign section!!");
                HidePatientViews();
                BindPatientList();
                ViewPatientListDiv.Visible = true;
                return;
            }
            
            // int patientid = Convert.ToInt32(PatientIDforVitalSign.Value);
            //int patientid =(int) Session["PatientIDforVitalSign"];
            VitalSign newVitalSign = new VitalSign()
            {
                PatientID = patientid,// Convert.ToInt32(AddNewVitalSignPatientDDL.SelectedValue.ToString()),
                FMPatientID=familyMemberid,
                Temprature = Convert.ToDecimal(AddPatientFamilyMemberVitalSignTempratureTxtBox.Text),
                Pulse = Convert.ToDecimal(AddPatientFamilyMemberVitalSignPulseTxtBox.Text),
                Respiration = Convert.ToDecimal(AddPatientFamilyMemberVitalSignRespirationTxtBox.Text),
                BloodPressure = Convert.ToDecimal(AddPatientFamilyMemberVitalSignBloodPressureTxtBox.Text),
                Weight = Convert.ToDecimal(AddPatientFamilyMemberVitalSignWeightTxtBox.Text),
                Height = Convert.ToDecimal(AddPatientFamilyMemberVitalSignHeightTxtBox.Text)

            };


            int response = Pasture.AddNewVitalSign(newVitalSign);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Vital Sign successfly submited!!");
                AddFMClearVitalSignFields();
                HideFamilyPlanViews();
                ViewPatientFamilyMemberListDiv.Visible = true;
                BindFamilyMemberList(patientid);

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
    private void HideFamilyPlanViews()
    {
        AddNewPatientFamilyMemberDiv.Visible = false;
        ViewPatientFamilyMemberListDiv.Visible = false;
        ViewPatientWithFamilyPlanListDiv.Visible = false;
        ViewPatientFamilyMemberDiv.Visible = false;
        EditPatientFamilyMemberDiv.Visible = false;
        AddPatientFamilyMemberVitalSignDiv.Visible = false;

    }
    #endregion

    #region Consultation

    private  void ClearConsultationFields()
    {
        AddNewConsultationSymptums.Text = string.Empty;
        AddNewConsultationDiagnosis.Text=string.Empty;
        AddNewConsultationPrescription.Text = string.Empty;
        AddNewConsultationNote.Text = string.Empty;
        EditConsultationSymptums.Text = string.Empty;
        EditConsultationDiagnosis.Text = string.Empty;
        EditConsultationPrescription.Text = string.Empty;
        EditConsultationNote.Text = string.Empty;

    }

    protected void ViewConsultaionListAddNewConsultation_Click(object sender, EventArgs e)
    {
        HideConsultationViews();
        PopulatePatientList(AddConsultationPatientlistddl);
        AddNewConsultationDiv.Visible = true;
    }
    protected void EditConsultationBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int consultid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Session["EditConsultationId"] = consultid;
            Consultation consultation = Pasture.GetConsultationByID(consultid);
            EditConsultationPatientName.Text = Pasture.GetConsulteeFullNameByID(consultid);
            EditConsultationSymptums.Text = consultation.Symptums.ToString();
            EditConsultationDiagnosis.Text = consultation.Diagnosis.ToString();
            EditConsultationPrescription.Text = consultation.Prescription.ToString();
            EditConsultationNote.Text = consultation.Note.ToString();


            HideConsultationViews();
            EditConsultationDiv.Visible = true;



        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void ViewConsultationBtn_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            int consultid = Convert.ToInt32((btn.CommandArgument.ToString()));
            Consultation consultation = Pasture.GetConsultationByID(consultid);
            ViewConsultationPatientName.Text = Pasture.GetConsulteeFullNameByID(consultid);
            ViewConsultationSymptums.Text = consultation.Symptums.ToString();
            ViewConsultationDiagnosis.Text = consultation.Diagnosis.ToString();
            ViewConsultationPrescription.Text = consultation.Prescription.ToString();
            ViewConsultationNote.Text = consultation.Note.ToString();

            
            HideConsultationViews();
            ViewConsultationDiv.Visible = true;



        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void AddNewConsultationBackButton_Click(object sender, EventArgs e)
    {
        HideConsultationViews();
        BindConsultationList();
        ViewConsultaionListDiv.Visible = true;
    }
    protected void AddNewConsultationProceedButton_Click(object sender, EventArgs e)
    {
        try
        {

            if (AddConsultationPatientlistddl.SelectedValue == "-1")
            {
                ShowErrorResponse("Select patient try again!!");
                return;
            }

            Consultation newconsultation = new Consultation()
            {
                PatientID = Convert.ToInt32(AddConsultationPatientlistddl.SelectedValue.ToString()),
                Symptums = AddNewConsultationSymptums.Text,
                Diagnosis = AddNewConsultationDiagnosis.Text,
                Prescription = AddNewConsultationPrescription.Text,
                Note = AddNewConsultationNote.Text

            };
            if (AddNewConsultationPatientFamilyMemberDDL.Visible == true && AddNewConsultationPatientFamilyMemberDDL.SelectedValue.ToString() != "-1")
            {
                newconsultation.ConsultationForID = Convert.ToInt32(AddNewConsultationPatientFamilyMemberDDL.SelectedValue.ToString());
            }


            int response = Pasture.AddNewConsultation(newconsultation);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Consultation successfly submited!!");
                ClearConsultationFields();
            }
            else
            {
                ShowErrorResponse("Consultation not submited kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Consultation not submited kindly contact admin.");
        }
    }
    protected void EditConsultationUpdateButton_Click(object sender, EventArgs e)
    {
        try
        {

           
            int Consultationid = (int)Session["EditConsultationId"];
            Consultation updateconsultation = new Consultation()
            {
                ConsultationID = Consultationid,
                //PatientID = Convert.ToInt32(AddNewVitalSignPatientDDL.SelectedValue.ToString()),
                Symptums = EditConsultationSymptums.Text,
                Diagnosis = EditConsultationDiagnosis.Text,
                Prescription = EditConsultationPrescription.Text,
                Note = EditConsultationNote.Text

            };
            //if (AddNewConsultationPatientFamilyMemberDDL.Visible == true && AddNewConsultationPatientFamilyMemberDDL.SelectedValue.ToString() != "-1")
            //{
            //    updateconsultation.ConsultationForID = Convert.ToInt32(AddNewConsultationPatientFamilyMemberDDL.SelectedValue.ToString());
            //}


            int response = Pasture.UpdateConsultation(updateconsultation);
            if (response > 0)
            {

                PastureAlert.PopSuccessAlert("Consultation successfly updated!!");
                ClearConsultationFields();
            }
            else
            {
                ShowErrorResponse("Consultation not updated kindly try again!!");
            }
        }
        catch (Exception ex)
        {
            ShowErrorResponse("Consultation not updated kindly contact admin.");
        }
    }
    protected void EditConsultationBackButton_Click(object sender, EventArgs e)
    {
        HideConsultationViews();
        BindConsultationList();
        ViewConsultaionListDiv.Visible = true;
    }
    protected void ViewConsultationBackButton_Click(object sender, EventArgs e)
    {
        HideConsultationViews();
        BindConsultationList();
        ViewConsultaionListDiv.Visible = true;
    }
    protected void AddConsultationPatientlistddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (AddConsultationPatientlistddl.SelectedValue == "-1")
        {
            int patientid = Convert.ToInt32(AddConsultationPatientlistddl.SelectedValue.ToString());
            int VerifyPatientPlan = Pasture.VerifyPatientPlanByID(patientid);
            if (VerifyPatientPlan > 1)
            {
                AddNewConsultationPatientFamilyMemberDiv.Visible = true;
                PopulatePatientFMList(AddNewConsultationPatientFamilyMemberDDL, patientid);
            }
        }
    }
    private void HideConsultationViews()
    {
        AddNewConsultationDiv.Visible = false;
        ViewConsultaionListDiv.Visible = false;
        ViewConsultationDiv.Visible = false;
        EditConsultationDiv.Visible = false;
    }

    #endregion









    
}