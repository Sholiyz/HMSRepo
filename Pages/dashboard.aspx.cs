using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string role = Pasture.GetCurrentUserSessionRole();
        ManageRoleView(role);

        CurrentPatientNumberLiteral.Text = Pasture.GetPatientsCount().ToString();

        TotalStaffLiteral.Text = Pasture.GetEmployeeList().Count().ToString();

        DoctorNumberLiteral.Text = Pasture.GetDoctorsList().Count().ToString();

        NurseNumberLiteral.Text = Pasture.GetNursesList().Count().ToString();

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

        }
        if (rolename.ToLower().Contains("nurse"))
        {
            dashboard.Visible = false;
            patientsportal.Visible = true;
            nursesportal.Visible = true;
            doctorsportal.Visible = false;
            adminportal.Visible = false;

            return;

        }
        if (rolename.ToLower().Contains("doctor"))
        {
            dashboard.Visible = true;
            patientsportal.Visible = true;
            doctorsportal.Visible = true;
            nursesportal.Visible = false;
            adminportal.Visible = false;

            return;
        }
        else
        {

        }
    }
}