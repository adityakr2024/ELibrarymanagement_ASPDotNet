using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1
{
    public partial class admin_login : System.Web.UI.Page
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

                    string query = "SELECT username, full_name FROM admin_login_tbl WHERE username = @username AND password = @password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", txtBoxAdminID.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtBoxPassword.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        // Assuming column indices for username and full_name
                        Session["username"] = dt.Rows[0]["username"].ToString();
                        Session["fullname"] = dt.Rows[0]["full_name"].ToString();
                        Session["role"] = "admin";  // Updated to "admin" for admin role
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
        }
    }
}
