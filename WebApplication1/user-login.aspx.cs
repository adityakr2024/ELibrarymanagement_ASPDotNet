using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class user_login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open(); 

                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id AND password = @password", con);
                    cmd.Parameters.AddWithValue("@member_id", txtBoxMemberID.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtBoxPassword.Text.Trim());

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {

                            Response.Write("<script>alert('Login Successful: "+ dr.GetValue(8).ToString()+"');</script>");
                            Session["username"] = dr.GetValue(8).ToString();
                            Session["fullname"] = dr.GetValue(0).ToString();
                            Session["role"] = "user";
                            Session["status"] = dr.GetValue(10).ToString();
                        }
                        Response.Redirect("homepage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Credentials');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }

            //Response.Write("<script>alert('Sign Up Successful. Go to User Login Page');</script>");
        }
    }
}