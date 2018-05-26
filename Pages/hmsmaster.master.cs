using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_hmsmaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthUser CurrentUser = Pasture.GetCurrentUserSessionDetail();
        if (CurrentUser == null)
        {
            Response.Redirect("./login.aspx");
            return;
        }
        else
        {

            Employee Emp = Pasture.GetEmployeeByID(CurrentUser.StaffID);

            fullnameLiteraltext.Text = Emp.FullName;
            userroleLiteraltext.Text = Pasture.GetCurrentUserSessionRole();

            string imageString;
            byte[] bytes = (byte[])Emp.Picture;
            if (bytes != null )
            {
                imageString = Convert.ToBase64String(bytes, 0, bytes.Length);
                Userimage.ImageUrl = "data:image/png;base64," + imageString;
            }
            else
            {
                Userimage.ImageUrl = "../assets/img/dummypicture.png";
            }
            
        }
    }

    protected void LogoutTextBox_Click(object sender, EventArgs e)
    {
        Pasture.EndCurrentSession();
        Response.Redirect("./login.aspx");
        return;
    }

    protected void ResetPasswordTextBox_Click(object sender, EventArgs e)
    {
        string role = Pasture.GetCurrentUserSessionRole().ToLower();
        if (role.Contains("nurse"))
        {
            Session["PageToReset"] = "./nurse-portal.aspx";
        }
        if (role.Contains("doctor"))
        {
            Session["PageToReset"] = "./doctors-portal.aspx";
        }
        if (role == "admin")
        {
            Session["PageToReset"] = "./dashboard.aspx";            
        }
        if (role == "super-admin")
        {
            Session["PageToReset"] = "./dashboard.aspx";           
        }
        
        Response.Redirect("./password-reset.aspx");
        return;
    }
}
