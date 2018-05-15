using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Alert
/// </summary>
public static class Alert
{
    //public static void Alert()
    //{
    //    //
    //    // TODO: Add constructor logic here
    //    //
    //}
    //string message = "Heres a message!";
    //string scripts = "<script>swal('Here is a message!', 'It is pretty, is not it?');</script>";
    //string scriptsuccess = "<script>swal('Good job!', 'You clicked the button!', 'success');</script>";
    //string scripterror = "<script>sweetAlert('Oops...', 'Something went wrong !!', 'error');</script>";

    public static void CallAlert(string alerttype,string message)
    {
        if (alerttype == Alert.Alerttype.success.ToString())
        {
            System.Web.UI.Page page = (System.Web.UI.Page)HttpContext.Current.Handler;
            string scriptsuccess = "<script>swal('Good job!', '" + message + "', 'success');</script>";
            page.ClientScript.RegisterStartupScript(page.GetType(), "Scripts", scriptsuccess);

        }
        else if(alerttype == Alert.Alerttype.error.ToString())
        {
            System.Web.UI.Page page = (System.Web.UI.Page)HttpContext.Current.Handler;
            string scriptsuccess = "<script>swal('Oops...', '"+message+"', 'error');</script>";
            page.ClientScript.RegisterStartupScript(page.GetType(), "Scripts", scriptsuccess);

        }
        else if (alerttype == Alert.Alerttype.warming.ToString())
        {
            System.Web.UI.Page page = (System.Web.UI.Page)HttpContext.Current.Handler;
            string scriptsuccess = "<script>swal('Warning!!', '" + message + "', 'warning');</script>";
            page.ClientScript.RegisterStartupScript(page.GetType(), "Scripts", scriptsuccess);

        }
    }
    public static void CallDefaultAlert(string alerttype)
    {
        if (alerttype == Alert.Alerttype.success.ToString())
        {
            System.Web.UI.Page page = (System.Web.UI.Page)HttpContext.Current.Handler;
            string scriptsuccess = "<script>swal('Success!', 'Action successful.', 'success');</script>";
            page.ClientScript.RegisterStartupScript(page.GetType(), "Scripts", scriptsuccess);

        }
        else if (alerttype == Alert.Alerttype.error.ToString())
        {
            System.Web.UI.Page page = (System.Web.UI.Page)HttpContext.Current.Handler;
            string scriptsuccess = "<script>swal('Oops...', 'Action Not successful, kindly try again.', 'error');</script>";
            page.ClientScript.RegisterStartupScript(page.GetType(), "Scripts", scriptsuccess);

        }
        else if (alerttype == Alert.Alerttype.warming.ToString())
        {
            System.Web.UI.Page page = (System.Web.UI.Page)HttpContext.Current.Handler;
            string scriptsuccess = "<script>swal('Warning!!', 'Kindly check and try again.', 'warning');</script>";
            page.ClientScript.RegisterStartupScript(page.GetType(), "Scripts", scriptsuccess);

        }
    }
    public enum Alerttype
    {
        success,
            error,
            warming
    };

    public static void CallNotification(string notetype,string message)
    {
        if (notetype == Alert.Alerttype.success.ToString())
        {
            System.Web.UI.Page page = (System.Web.UI.Page)HttpContext.Current.Handler;
            
        }
        else if (notetype == Alert.Alerttype.error.ToString())
        {
           

        }
        else if (notetype == Alert.Alerttype.warming.ToString())
        {
            

        }
    }
}