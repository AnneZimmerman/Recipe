﻿using CPUFramework;
using System.Data;

namespace RecipeWinForms
{
    public partial class frmSearch : Form
    {
        public frmSearch()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
            gRecipe.CellDoubleClick += GRecipe_CellDoubleClick;
            FormatGrid();
        }

        private void SearchForRecipe(string recipename)
        {
            string sql = "select RecipeId, RecipeName, PublishedDate, Calories, RecipeStatus from Recipe r where r.RecipeName like '%" + recipename + "%'";
            DataTable dt = SQLUtility.GetDataTable(sql);
            gRecipe.DataSource = dt;
            gRecipe.Columns["RecipeId"].Visible = false;
        }

        private void ShowRecipeForm(int rowindex)
        {
            int id = (int)gRecipe.Rows[rowindex].Cells["RecipeId"].Value;
            frmRecipe frm = new frmRecipe();
            frm.ShowForm(id);
        }

        private void FormatGrid()
        {
            gRecipe.AllowUserToAddRows = false;
            gRecipe.ReadOnly = true;
            gRecipe.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            gRecipe.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void GRecipe_CellDoubleClick(object? sender, DataGridViewCellEventArgs e)
        {
            ShowRecipeForm(e.RowIndex);
        }

        private void BtnSearch_Click(object? sender, EventArgs e)
        {
            SearchForRecipe(txtRecipeName.Text);
        }
    }
}
