using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check if nurse or doctor or Admin
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string Username = usernametextbox.Value.ToString();
        string Password = passwordtextbox.Value.ToString();
        string myval=Pasture.LoginMessage.invalidedetail.ToString();


        if (!(Username==string.Empty && Password == string.Empty))
        {
            int valresponse = Pasture.VefiryLoginDetail(Username, Password);
            if (valresponse == 100)
            {
                Pasture.CreateUserSession(Username);                
                string userrole= Pasture.GetCurrentUserSessionRole();                
                GetNavigateToPage(userrole);                
                return;
            }
            if (valresponse == 101)
            {
                PastureAlert.PopWarningAlert("Invalide username and password!!!");
                return;
            }
            if (valresponse == 102)
            {
                PastureAlert.PopWarningAlert("User logged out kindly contact the administrator!!!");
                return;
            }
            if (valresponse == 103)
            {
                PastureAlert.PopWarningAlert("Account is inactive kinly contact the adminstrator!!!");
                return;
            }
            if (valresponse == 104)
            {
                PastureAlert.PopErrorAlert("Bad Request- Account does not exist!!!");
                return;
            }
        }
        else
        {
            //ShowWarningResponse("All fields required!!");
             PastureAlert.PopWarningAlert("All fields required!!");
            //log error
        }




    }
    private void GetNavigateToPage(string role)
    {
        role = role.ToLower();
        if (role.Contains("nurse"))
        {
            Response.Redirect("./nurse-portal.aspx");
            return;
        }
        if (role.Contains("doctor"))
        {
            Response.Redirect("./doctors-portal.aspx");
            return;
        }
        if (role == "admin")
        {
            Response.Redirect("./dashboard.aspx");
            return;
        }
        if (role=="super-admin")
        {
            Response.Redirect("./dashboard.aspx");
            return;
        }

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

}