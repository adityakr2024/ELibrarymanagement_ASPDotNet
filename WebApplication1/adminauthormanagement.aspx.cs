using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewAuthors.DataBind();
        }

        protected void btnAddAuthor_Click(object sender, EventArgs e)
        {
            if(checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author ID already exists.');</script>");
            }
            else
            {
                addNewAuthor();
            }
        }
        void addNewAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl (author_id, author_name) " +
                        "Values(@author_id, @author_name)", con);
                    cmd.Parameters.AddWithValue("@author_id", txtBoxAuthorId.Text.Trim());
                    cmd.Parameters.AddWithValue("@author_name", txtBoxAuthorName.Text.Trim());
                    

                    cmd.ExecuteNonQuery();
                }

                Response.Write("<script>alert('Author added successfully.');</script>");
                clearForm();
                GridViewAuthors.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfAuthorExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id = @author_id", con);
                    cmd.Parameters.AddWithValue("@author_id", txtBoxAuthorId.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if(dt.Rows.Count >= 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    } 
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void updateAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update author_master_tbl set author_name = @author_name " +
                        "where author_id = @author_id", con);
                    cmd.Parameters.AddWithValue("@author_name", txtBoxAuthorName.Text.Trim());
                    cmd.Parameters.AddWithValue("@author_id", txtBoxAuthorId.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Author udated successfully');</script>");
                    clearForm();
                    GridViewAuthors.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btnUpdateAuthor_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                updateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exists');</script>");
            }
        }

        void deleteAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id = @author_id ", con);
                    cmd.Parameters.AddWithValue("@author_id", txtBoxAuthorId.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Author deleted successfully');</script>");
                    clearForm();
                    GridViewAuthors.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnDeleteAuthor_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exists');</script>");
            }
        }
        void clearForm()
        {
            txtBoxAuthorId.Text = string.Empty;
            txtBoxAuthorName.Text = string.Empty;
        }

        void getAuthorById()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl WHERE author_id = @author_id", con);
                    cmd.Parameters.AddWithValue("@author_id", txtBoxAuthorId.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        txtBoxAuthorName.Text = dt.Rows[0]["author_name"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Author not found');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnGoAuthorId_Click(object sender, EventArgs e)
        {
            getAuthorById();
        }

    }
}