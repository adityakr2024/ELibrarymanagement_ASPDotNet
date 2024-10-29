using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillAuthorPublisherValues();
            GridView1.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getBookById();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(checkIfBookExists())
            {
                Response.Write("<script>alert('Book already exists');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        //User Defined Functions
        void fillAuthorPublisherValues()
        {
            try
            {
                using (SqlConnection con =  new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddlAuthorName.DataSource = dt;
                    ddlAuthorName.DataValueField = "author_name";
                    ddlAuthorName.DataBind();

                    cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl", con);
                    da = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    da.Fill(dt);
                    ddlPublisherName.DataSource = dt;
                    ddlPublisherName.DataValueField = "publisher_name";
                    ddlPublisherName.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open(); 
                    SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tb WHERE book_id = @book_id " +
                        "OR book_name = @book_name", con);
                    cmd.Parameters.AddWithValue("@book_id", txtBoxBookId.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", txtBoxBookName.Text.Trim());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count > 0;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false; 
            }
        }


        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in lstBoxGenre.GetSelectedIndices())
                {
                    genres = genres + lstBoxGenre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/books.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = @"
                    INSERT INTO [elibraryDB].[dbo].[book_master_tbl] (
                        [book_id],
                        [book_name],
                        [genre],
                        [author_name],
                        [publisher_name],
                        [publish_date],
                        [language],
                        [edition],
                        [book_cost],
                        [no_of_pages],
                        [book_description],
                        [actual_stock],
                        [current_stock],
                        [book_img_link]
                    ) VALUES (
                        @book_id,
                        @book_name,
                        @genre,
                        @author_name,
                        @publisher_name,
                        @publish_date,
                        @language,
                        @edition,
                        @book_cost,
                        @no_of_pages,
                        @book_description,
                        @actual_stock,
                        @current_stock,
                        @book_img_link
                    );";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Adding parameters
                        cmd.Parameters.AddWithValue("@book_id", txtBoxBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", txtBoxBookName.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", genres);
                        cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@publish_date", txtBoxPublishDate.Text.Trim()); // Ensure publishDate is a DateTime object
                        cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@edition", txtBoxEdition.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", txtBoxBookCost.Text.Trim());
                        cmd.Parameters.AddWithValue("@no_of_pages", txtBoxPages.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_description", txtBoxBookDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@actual_stock", txtBoxActualStock.Text.Trim());
                        cmd.Parameters.AddWithValue("@current_stock", txtBoxActualStock.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_img_link", filepath);

                        // Execute the command
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Book Added Successfully');</script>");
                        GridView1.DataBind();
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //void getBookById()
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tb WHERE book_id = @book_id", con);
        //            cmd.Parameters.AddWithValue("@book_id", txtBoxBookId.Text.Trim());

        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);

        //            if (dt.Rows.Count >= 1)
        //            {
        //                txtBoxBookName.Text = dt.Rows[0]["book_name"].ToString();
        //                ddlLanguage.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
        //                txtBoxPublishDate.Text = dt.Rows[0]["publish_date"].ToString();
        //                ddlAuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
        //                ddlPublisherName.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
        //                lstBoxGenre.ClearSelection();
        //                string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
        //                for (int i = 0; i < genre.Length; i++)
        //                {
        //                    for (int j = 0; j < lstBoxGenre.Items.Count; j++)
        //                    {
        //                        if (lstBoxGenre.Items[j].ToString() == genre[i].Trim())
        //                        {
        //                            lstBoxGenre.Items[j].Selected = true;
        //                        }

        //                    }
        //                }


        //                txtBoxEdition.Text = dt.Rows[0]["edition"].ToString();
        //                txtBoxBookCost.Text = dt.Rows[0]["book_cost"].ToString();
        //                txtBoxPages.Text = dt.Rows[0]["no_of_pages"].ToString();
        //                txtBoxBookDescription.Text = dt.Rows[0]["book_description"].ToString();
        //                txtBoxActualStock.Text = dt.Rows[0]["actual_stock"].ToString();
        //                txtBoxCurrentStock.Text = dt.Rows[0]["current_stock"].ToString();
        //                txtBoxIssuedBooks.Text = "" + Convert.ToString32(dt.Rows[0]["actual_stock"].ToString()) -
        //                    Convert.ToString32(dt.Rows[0]["current_stock"].ToString());
        //                //imgBook.ImageUrl = dt.Rows[0]["book_img_link"].ToString();
        //            }
        //            else
        //            {
        //                Response.Write("<script>alert('Invalid Book ID');</script>");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle any exceptions and alert the user
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }
        //}

    }
}