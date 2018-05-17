using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResponseAlert : System.Web.UI.UserControl
{

    private string NMessage;
    public string NewMessage
    {
        get { return NMessage; }
        set { NMessage = value; }
    }
    private bool NVisible;
    public bool NoteVisible
    {
        get { return NVisible; }
        set { NVisible = value; }
    }
    private string Ntype;
    public string NoteType
    {
        get { return Ntype; }
        set { Ntype = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        AlertContiner.Visible = false;
        //AlertDiv.Attributes["class"] = divsuccesscss;
        
        //AlertMessage.Text = "New Message";
    }
    public void ShowNotification()
    {
        
        string divwarningcss = "alert alert-warning alert-dismissible";
        string divdangercss = "alert alert-danger alert-dismissable";
        string divsuccesscss = "alert alert-success alert-dismissable";
        string divinfocss = "alert alert-info alert-dismissable";
        
        if (NoteType.ToLower() == "success")
        {
            AlertDiv.Attributes["class"] = divsuccesscss;
            AlertContiner.Visible = NoteVisible;           
            AlertMessage.Text = NewMessage;
        }
        else if (NoteType.ToLower() == "error")
        {
            AlertDiv.Attributes["class"] = divdangercss;
            AlertContiner.Visible = NoteVisible;
            AlertMessage.Text = NewMessage;
        }
        else if (NoteType.ToLower() == "warning")
        {
            AlertDiv.Attributes["class"] = divwarningcss;
            AlertContiner.Visible = NoteVisible;
            AlertMessage.Text = NewMessage;
        }
        else if (NoteType.ToLower() == "info")
        {
            AlertDiv.Attributes["class"] = divinfocss;
            AlertContiner.Visible = NoteVisible;
            AlertMessage.Text = NewMessage;
        }

    }
    public void HideNotification()
    {
        AlertContiner.Visible = true;
        AlertMessage.Text = string.Empty;
    }
    public enum Notificationtype
    {
        success = 0,
        error = 1,
        warning = 2,
        info =3
    };
}