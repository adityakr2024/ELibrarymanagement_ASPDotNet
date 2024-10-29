using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactive");
        }

        protected void btnDeletePermanently_Click(object sender, EventArgs e)
        {
            deleteMemberById();
        }
        void getMemberByID()
        {

            if (string.IsNullOrEmpty(txtBoxMemberId.Text.Trim()))
            {
                Response.Write("<script>alert('Please enter a valid Member ID');</script>");
            }
            else
            {
                if (!checkIfMemberExists())
                {
                    Response.Write("<script>alert('Member does not exist');</script>");
                    return;
                }
                try
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id", con);
                        cmd.Parameters.AddWithValue("@member_id", txtBoxMemberId.Text.Trim());

                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                txtBoxFullName.Text = dr.GetValue(0).ToString();
                                txtBoxAccountStatus.Text = dr.GetValue(10).ToString();
                                txtBoxDoB.Text = dr.GetValue(1).ToString();
                                txtBoxContactNo.Text = dr.GetValue(2).ToString();
                                txtBoxEmailId.Text = dr.GetValue(3).ToString();
                                txtBoxState.Text = dr.GetValue(4).ToString();
                                txtBoxCity.Text = dr.GetValue(5).ToString();
                                txtBoxPinCde.Text = dr.GetValue(6).ToString();
                                txtBoxFullAddresss.Text = dr.GetValue(7).ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }
        
        void updateMemberStatusByID(string status)
        {
            if (string.IsNullOrEmpty(txtBoxMemberId.Text.Trim()))
            {
                Response.Write("<script>alert('Please enter a valid Member ID');</script>");
            }
            else 
            {
                if (!checkIfMemberExists())
                {
                    Response.Write("<script>alert('Member does not exist. Can not update.');</script>");
                    return;
                }
                try
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status = @account_status WHERE member_id = @member_id", con);

                        cmd.Parameters.AddWithValue("@member_id", txtBoxMemberId.Text);
                        cmd.Parameters.AddWithValue("@account_status", status);
                        cmd.ExecuteNonQuery();
                        GridView1.DataBind();
                        Response.Write("<script>alert('Member Status Updated');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }

        void deleteMemberById()
        {
            if (string.IsNullOrEmpty(txtBoxMemberId.Text.Trim()))
            {
                Response.Write("<script>alert('Please enter a valid Member ID');</script>");
            }
            else
            {
                if (!checkIfMemberExists())
                {
                    Response.Write("<script>alert('Member does not exist. Can not delete.');</script>");
                    return; 
                }
                try
                {

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id = @member_id", con);

                        cmd.Parameters.AddWithValue("@member_id", txtBoxMemberId.Text);
                        cmd.ExecuteNonQuery();
                        GridView1.DataBind();
                        clearForm();
                        Response.Write("<script>alert('Member Deleted Successfully');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void clearForm()
        {
            txtBoxMemberId.Text = string.Empty;  
            txtBoxFullName.Text = string.Empty;   
            txtBoxAccountStatus.Text = string.Empty;
            txtBoxDoB.Text = string.Empty;
            txtBoxContactNo.Text = string.Empty;
            txtBoxEmailId.Text = string.Empty;
            txtBoxState.Text = string.Empty;
            txtBoxCity.Text = string.Empty;
            txtBoxPinCde.Text = string.Empty;
            txtBoxFullAddresss.Text = string.Empty;
        }

        bool checkIfMemberExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", txtBoxMemberId.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        return true; // Member exists
                    }
                    else
                    {
                        return false; // Member does not exist
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false; // Return false on error
            }
        }

    }
}
