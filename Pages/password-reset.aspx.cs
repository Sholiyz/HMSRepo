using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_password_reset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthUser CurrentUser = Pasture.GetCurrentUserSessionDetail();
        if (CurrentUser == null)
        {
            Response.Redirect("./login.aspx");
        }

    }

    protected void PasswordResetButton_Click(object sender, EventArgs e)
    {
       AuthUser CurrentUser = Pasture.GetCurrentUserSessionDetail();
        AuthUser UpdateUser = Pasture.GetUserByID(CurrentUser.UserID);
        if (UpdateUser != null)
        {
            bool VerifyPassword = Pasture.VerifyUserPassword(CurrentUser.Password, currentpassword.Value.ToString());
            if (VerifyPassword)
            {
                if (newpassword.Value.ToString() == confirmnewpassword.Value.ToString())
                {
                    UpdateUser.Password = newpassword.Value.ToString();
                }
                else
                {
                    PastureAlert.PopWarningAlert("Password not match, kindly verify and try again.");
                }

            }
            else
            {
                PastureAlert.PopWarningAlert("Invalid user detail, kindly verify and try again.");
            }
        }
        else
        {
            PastureAlert.PopWarningAlert("Invalid user id, kindly verify and try again.");
        }
 
    }

    protected void ResetBackButton_Click(object sender, EventArgs e)
    {
        //string role = Pasture.GetCurrentUserSessionRole();
        //if (role.Contains("nurse"))
        //{
        //    //Session["PageToReset"] = "./nurse-portal.aspx";
        //    Response.Redirect("./nurse-portal.aspx");
        //}
        //if (role.Contains("doctor"))
        //{
        //    //Session["PageToReset"] = "./doctors-portal.aspx";
        //    Response.Redirect("./doctors-portal.aspx");
        //}
        //if (role == "admin")
        //{
        //    //Session["PageToReset"] = "./dashboard.aspx";
        //    Response.Redirect("./dashboard.aspx");
        //}
        //if (role == "super-admin")
        //{
        //    //Session["PageToReset"] = "./dashboard.aspx";
        //    Response.Redirect("./dashboard.aspx");
        //}
        string Urlpath = (string)Session["PageToReset"];
        Response.Redirect(Urlpath);
    }
}