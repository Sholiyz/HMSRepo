using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PastureAlert
/// </summary>
public static class PastureAlert
{
    //public static void PastureAlert()
    //{
    //    //
    //    // TODO: Add constructor logic here
    //    //
    //}

    public static void PopSuccessAlert(string message)
    {
        Alert.CallAlert(Alert.Alerttype.success.ToString(),string.Format("{0}",message));
    }
    public static void PopWarningAlert(string message)
    {
        Alert.CallAlert(Alert.Alerttype.warning.ToString(), string.Format("{0}", message));
    }

    public static void PopErrorAlert(string message)
    {
        Alert.CallAlert(Alert.Alerttype.error.ToString(), string.Format("{0}", message));
    }

    public enum ResponseNotetype
    {
        success,
        error,
        warning,
        info
    };

}