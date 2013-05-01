using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class EmployeeDirectory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindList();
        }
    }
    protected void BindList()
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Dorknozzle"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
            "SELECT EmployeeID, Name, Username FROM Employees", 
            conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            employeesList.DataSource = reader;
            employeesList.DataBind();
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
    }
        
    protected void employeesList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "MoreDetailsPlease")
        {
            Literal li;
            li = (Literal)e.Item.FindControl("extraDetailsLiteral");
            li.Text = "Employee ID: <strong>" + e.CommandArgument + "</strong><br />";
        }
    }
}