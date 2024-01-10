namespace RecipeWinForms
{
    partial class frmRecipe
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tblMain = new System.Windows.Forms.TableLayoutPanel();
            this.lblCaptionRecipeName = new System.Windows.Forms.Label();
            this.lblCaptionDraftDate = new System.Windows.Forms.Label();
            this.lblCaptionDatePublished = new System.Windows.Forms.Label();
            this.lblCaptionArchivedDate = new System.Windows.Forms.Label();
            this.lblCaptionCalories = new System.Windows.Forms.Label();
            this.lblCaptionRecipeStatus = new System.Windows.Forms.Label();
            this.lblRecipeName = new System.Windows.Forms.Label();
            this.lblDraftDate = new System.Windows.Forms.Label();
            this.lblDatePublished = new System.Windows.Forms.Label();
            this.lblDateArchived = new System.Windows.Forms.Label();
            this.lblCalories = new System.Windows.Forms.Label();
            this.lblRecipeStatus = new System.Windows.Forms.Label();
            this.tblMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // tblMain
            // 
            this.tblMain.ColumnCount = 2;
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tblMain.Controls.Add(this.lblCaptionRecipeName, 0, 0);
            this.tblMain.Controls.Add(this.lblCaptionDraftDate, 0, 1);
            this.tblMain.Controls.Add(this.lblCaptionDatePublished, 0, 2);
            this.tblMain.Controls.Add(this.lblCaptionArchivedDate, 0, 3);
            this.tblMain.Controls.Add(this.lblCaptionCalories, 0, 4);
            this.tblMain.Controls.Add(this.lblCaptionRecipeStatus, 0, 5);
            this.tblMain.Controls.Add(this.lblRecipeName, 1, 0);
            this.tblMain.Controls.Add(this.lblDraftDate, 1, 1);
            this.tblMain.Controls.Add(this.lblDatePublished, 1, 2);
            this.tblMain.Controls.Add(this.lblDateArchived, 1, 3);
            this.tblMain.Controls.Add(this.lblCalories, 1, 4);
            this.tblMain.Controls.Add(this.lblRecipeStatus, 1, 5);
            this.tblMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblMain.Location = new System.Drawing.Point(0, 0);
            this.tblMain.Name = "tblMain";
            this.tblMain.RowCount = 6;
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tblMain.Size = new System.Drawing.Size(645, 371);
            this.tblMain.TabIndex = 0;
            // 
            // lblCaptionRecipeName
            // 
            this.lblCaptionRecipeName.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionRecipeName.AutoSize = true;
            this.lblCaptionRecipeName.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCaptionRecipeName.Location = new System.Drawing.Point(3, 18);
            this.lblCaptionRecipeName.Name = "lblCaptionRecipeName";
            this.lblCaptionRecipeName.Size = new System.Drawing.Size(127, 25);
            this.lblCaptionRecipeName.TabIndex = 0;
            this.lblCaptionRecipeName.Text = "Recipe Name ";
            // 
            // lblCaptionDraftDate
            // 
            this.lblCaptionDraftDate.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionDraftDate.AutoSize = true;
            this.lblCaptionDraftDate.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCaptionDraftDate.Location = new System.Drawing.Point(3, 79);
            this.lblCaptionDraftDate.Name = "lblCaptionDraftDate";
            this.lblCaptionDraftDate.Size = new System.Drawing.Size(98, 25);
            this.lblCaptionDraftDate.TabIndex = 1;
            this.lblCaptionDraftDate.Text = "Draft Date";
            // 
            // lblCaptionDatePublished
            // 
            this.lblCaptionDatePublished.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionDatePublished.AutoSize = true;
            this.lblCaptionDatePublished.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCaptionDatePublished.Location = new System.Drawing.Point(3, 140);
            this.lblCaptionDatePublished.Name = "lblCaptionDatePublished";
            this.lblCaptionDatePublished.Size = new System.Drawing.Size(139, 25);
            this.lblCaptionDatePublished.TabIndex = 2;
            this.lblCaptionDatePublished.Text = "Date Published";
            // 
            // lblCaptionArchivedDate
            // 
            this.lblCaptionArchivedDate.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionArchivedDate.AutoSize = true;
            this.lblCaptionArchivedDate.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCaptionArchivedDate.Location = new System.Drawing.Point(3, 201);
            this.lblCaptionArchivedDate.Name = "lblCaptionArchivedDate";
            this.lblCaptionArchivedDate.Size = new System.Drawing.Size(130, 25);
            this.lblCaptionArchivedDate.TabIndex = 3;
            this.lblCaptionArchivedDate.Text = "Date Archived";
            // 
            // lblCaptionCalories
            // 
            this.lblCaptionCalories.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionCalories.AutoSize = true;
            this.lblCaptionCalories.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCaptionCalories.Location = new System.Drawing.Point(3, 262);
            this.lblCaptionCalories.Name = "lblCaptionCalories";
            this.lblCaptionCalories.Size = new System.Drawing.Size(80, 25);
            this.lblCaptionCalories.TabIndex = 4;
            this.lblCaptionCalories.Text = "Calories";
            // 
            // lblCaptionRecipeStatus
            // 
            this.lblCaptionRecipeStatus.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionRecipeStatus.AutoSize = true;
            this.lblCaptionRecipeStatus.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCaptionRecipeStatus.Location = new System.Drawing.Point(3, 325);
            this.lblCaptionRecipeStatus.Name = "lblCaptionRecipeStatus";
            this.lblCaptionRecipeStatus.Size = new System.Drawing.Size(122, 25);
            this.lblCaptionRecipeStatus.TabIndex = 5;
            this.lblCaptionRecipeStatus.Text = "Recipe Status";
            // 
            // lblRecipeName
            // 
            this.lblRecipeName.AutoSize = true;
            this.lblRecipeName.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblRecipeName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblRecipeName.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblRecipeName.Location = new System.Drawing.Point(148, 0);
            this.lblRecipeName.Name = "lblRecipeName";
            this.lblRecipeName.Size = new System.Drawing.Size(494, 61);
            this.lblRecipeName.TabIndex = 7;
            // 
            // lblDraftDate
            // 
            this.lblDraftDate.AutoSize = true;
            this.lblDraftDate.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblDraftDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDraftDate.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblDraftDate.Location = new System.Drawing.Point(148, 61);
            this.lblDraftDate.Name = "lblDraftDate";
            this.lblDraftDate.Size = new System.Drawing.Size(494, 61);
            this.lblDraftDate.TabIndex = 8;
            // 
            // lblDatePublished
            // 
            this.lblDatePublished.AutoSize = true;
            this.lblDatePublished.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblDatePublished.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDatePublished.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblDatePublished.Location = new System.Drawing.Point(148, 122);
            this.lblDatePublished.Name = "lblDatePublished";
            this.lblDatePublished.Size = new System.Drawing.Size(494, 61);
            this.lblDatePublished.TabIndex = 9;
            // 
            // lblDateArchived
            // 
            this.lblDateArchived.AutoSize = true;
            this.lblDateArchived.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblDateArchived.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDateArchived.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblDateArchived.Location = new System.Drawing.Point(148, 183);
            this.lblDateArchived.Name = "lblDateArchived";
            this.lblDateArchived.Size = new System.Drawing.Size(494, 61);
            this.lblDateArchived.TabIndex = 10;
            // 
            // lblCalories
            // 
            this.lblCalories.AutoSize = true;
            this.lblCalories.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblCalories.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblCalories.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCalories.Location = new System.Drawing.Point(148, 244);
            this.lblCalories.Name = "lblCalories";
            this.lblCalories.Size = new System.Drawing.Size(494, 61);
            this.lblCalories.TabIndex = 11;
            // 
            // lblRecipeStatus
            // 
            this.lblRecipeStatus.AutoSize = true;
            this.lblRecipeStatus.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblRecipeStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblRecipeStatus.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblRecipeStatus.Location = new System.Drawing.Point(148, 305);
            this.lblRecipeStatus.Name = "lblRecipeStatus";
            this.lblRecipeStatus.Size = new System.Drawing.Size(494, 66);
            this.lblRecipeStatus.TabIndex = 12;
            // 
            // frmRecipe
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(645, 371);
            this.Controls.Add(this.tblMain);
            this.Name = "frmRecipe";
            this.Text = "Recipe";
            this.tblMain.ResumeLayout(false);
            this.tblMain.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private TableLayoutPanel tblMain;
        private Label lblCaptionRecipeName;
        private Label lblCaptionDraftDate;
        private Label lblCaptionDatePublished;
        private Label lblCaptionArchivedDate;
        private Label lblCaptionCalories;
        private Label lblCaptionRecipeStatus;
        private Label lblRecipeName;
        private Label lblDraftDate;
        private Label lblDatePublished;
        private Label lblDateArchived;
        private Label lblCalories;
        private Label lblRecipeStatus;
    }
}