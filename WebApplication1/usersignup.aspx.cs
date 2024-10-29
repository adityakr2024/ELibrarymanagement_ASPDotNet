using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace WebApplication1
{
    public partial class usersignup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('Member already exists with this Member ID, try another ID');</script>");
            }
            else
            {
                signUpNewUser();
            }
        }

        bool checkMemberExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", SUtxtBoxUserId.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count >= 1; // Returns true if exists
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void signUpNewUser()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl(full_name, dob, contact_no, email, state, city, pincode, full_address, member_id, password, account_status) " +
                                                     "VALUES(@full_name, @dob, @contact_no, @email, @state, @city, @pincode, @full_address, @member_id, @password, @account_status)", con);
                    cmd.Parameters.AddWithValue("@full_name", SUtxtBoxFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", SUtxtBoxDoB.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", SUtxtBoxContactNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", SUtxtBoxEmailId.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", SUddlState.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", SUtxtBoxCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", SUtxtBoxPinCode.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", SUtxtBoxAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_id", SUtxtBoxUserId.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", SUtxtBoxPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@account_status", "pending");

                    cmd.ExecuteNonQuery();
                }

                Response.Write("<script>alert('Sign Up Successful. Go to User Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
