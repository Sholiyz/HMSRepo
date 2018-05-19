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
        CurrentPatientNumberLiteral.Text = Pasture.GetNursesList().Count().ToString();

        TotalStaffLiteral.Text = Pasture.GetEmployeeList().Count().ToString();

        DoctorNumberLiteral.Text = Pasture.GetDoctorsList().Count().ToString();

        NurseNumberLiteral.Text = Pasture.GetNursesList().Count().ToString();
        
    }
}