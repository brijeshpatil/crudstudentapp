﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ManageStudentService
{
    /// <summary>
    /// Summary description for ManageStudentService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ManageStudentService : System.Web.Services.WebService
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        [WebMethod]
        public string AddNewStudent(string StudentName,string EmailID,string Password)
        {
            cmd = new SqlCommand("AddNewStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SName", StudentName);
            cmd.Parameters.AddWithValue("@Email", EmailID);
            cmd.Parameters.AddWithValue("@Pass", Password);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();

            if(Status)
            {
                return "Record Saved";
            }
            else
            {
                return "There should be some error...";
            }
        }

        [WebMethod]
        public string UpdateStudent(int StudentID,string StudentName,string EmailID,string Password)
        {
            cmd = new SqlCommand("UpdateStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SID", StudentID);
            cmd.Parameters.AddWithValue("@SName", StudentName);
            cmd.Parameters.AddWithValue("@Email", EmailID);
            cmd.Parameters.AddWithValue("@Pass", Password);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            if (Status)
            {
                return "Record Updated";
            }
            else
            {
                return "There should be some error...";
            }
        }

        [WebMethod]
        public string DeleteStudent(int StudentID)
        {
            cmd = new SqlCommand("DeleteStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SID", StudentID);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            if (Status)
            {
                return "Record Deleted";
            }
            else
            {
                return "There should be some error...";
            }
        }

        [WebMethod]
        public DataSet GetAllStudents()
        {
            da = new SqlDataAdapter("GetAllStudents", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            ds = new DataSet();
            da.Fill(ds, "StudentTbl");
            return ds;
        }

    }
}
