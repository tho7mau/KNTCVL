﻿#region Thông tin chung
/// Mục đích        :Thêm mới + cập nhật thiết bị
/// Người tạo       :Ngô Hoài Hận
/// Phiên bản       :Release 1.0.0
/// Bản quyền       : LIINK .LTD
#endregion
using DotNetNuke.Common;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security.Permissions;
using System;
using System.Data;
using System.Globalization;
using System.Linq;

namespace KNTC
{
    public partial class CnFormMau : DotNetNuke.Entities.Modules.UserModuleBase
    {
        #region Properties
        int vThietBiId;

        //UserInfo _currentUser = UserController.Instance.GetCurrentUserInfo();
        //UserInfo _User = new UserInfo();     
        //public string vJavascriptMask = ClassParameter.vJavascriptMask;
        //public string vPathCommonJS = ClassParameter.vPathCommonJS;
        //HopKhongGiayDataContext vDataContext = new HopKhongGiayDataContext();
        //string vMacAddress = ClassCommon.GetMacAddress();
        //ThietBiController vThietBiControllerInfo = new ThietBiController();
        #endregion


        #region Events
        /// <summary>
        /// Event page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ////Kiem tra quyen dang nhap
                //CheckAccountLogin();
                ////Hien thong bao neu co loi xay ra
                //ShowMessage();
                ////Lay ID tu Form DS
                //if (Request.QueryString["id"] != null)
                //{
                //    vThietBiId = int.Parse(Request.QueryString["id"]);
                //}
                //if (!IsPostBack)
                //{
                //    SetFormInfo(vThietBiId);
                //    //textTenThietBi.Focus();                
                //}
                ////Edit Title
                //if (vThietBiId == 0)//Them moi
                //{
                //    this.ModuleConfiguration.ModuleControl.ControlTitle = "<a href='" + Globals.NavigateURL() + "' class='title-link'>Quản lý thiết bị</a> / Thêm mới";
                //}
                //else
                //{
                //    //var vThietBiInfo = vThietBiControllerInfo.GetThietBiTheoId(vThietBiId);
                //    if(vThietBiInfo != null)
                //    {
                //        this.ModuleConfiguration.ModuleControl.ControlTitle = "<a href='" + Globals.NavigateURL() + "' class='title-link'>Quản lý thiết bị</a> / " + vThietBiInfo.TENTHIETBI;
                //    }

                //}
            }
            catch (Exception ex)
            {
                //ClassCommon.THONGBAO_TOASTR(Page, ex, _currentUser, "Có lỗi trong quá trình xử lý, vui lòng liên hệ với quản trị!", "Thông báo lỗi", "error");
            }
        }


        protected void btnSua_Click(object sender, EventArgs e)
        {
            //btnSua.Visible = false;
            //btnCapNhat.Visible = true;
            //buttonThemmoi.Visible = false;
            SetEnableForm(true);
        }

        /// <summary>
        /// Event button Cap nhat
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (ValidateForm() == true)
            {
                CapNhat(vThietBiId);
            }
        }


        /// <summary>
        /// Event nhan button Bo Qua
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBoQua_Click(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL());
        }


        /// <summary>       
        /// Validate form và hiện thông báo lỗi
        /// </summary>       
        /// <returns>true: Form không có lỗi; flase: form có trường lỗi</returns>        
        /// <returns></returns>
        protected Boolean ValidateForm()
        {
            return false;
            //Boolean vResult = true;
            //string vToastrMessage = "";
            //string vToastrMessagePassword = "";
            //string oErrorMessage = "";
            //if (textTenThietBi.Text == "")
            //{
            //    textTenThietBi.CssClass += " vld";
            //    textTenThietBi.Focus();
            //    labelTenThietBi.Attributes["class"] += " vld";
            //    vToastrMessage = "Vui lòng nhập tên thiết bị, ";
            //    vResult = false;
            //}
            //else
            //{
            //    textTenThietBi.CssClass = textTenThietBi.CssClass.Replace("vld", "").Trim();
            //    labelTenThietBi.Attributes.Add("class", labelTenThietBi.Attributes["class"].ToString().Replace("vld", ""));
            //}

            //if (vThietBiControllerInfo.KiemTraTrungTenThietBi(vThietBiId, textTenThietBi.Text.Trim(), out oErrorMessage))
            //{
            //    textTenThietBi.CssClass += " vld";
            //    textTenThietBi.Focus();
            //    labelTenThietBi.Attributes["class"] += " vld";
            //    vToastrMessage = "Tên thiết bị đã tồn tại, ";
            //    vResult = false;
            //}         

            //if (vResult == false )
            //{
            //    ClassCommon.THONGBAO_TOASTR(Page, null, _User, vToastrMessage.Substring(0, vToastrMessage.Length - 2) + ".", "Thông báo", "error");
            //}          
            //return vResult;
        }

        protected void buttonThemmoi_Click(object sender, EventArgs e)
        {
            string vUrl = Globals.NavigateURL("Edit", "mid=" + this.ModuleId, "title=Thêm mới thiết bị", "id=0");
            Response.Redirect(vUrl);
        }
        #endregion


        #region Methods
        /// <summary>
        ///  Set thông tin cho form
        /// </summary>
        /// <param name="pThietBiId"></param>
        public void SetFormInfo(int pThietBiId)
        {
            //try
            //{
            //    if (pThietBiId == 0)//Thêm mới
            //    {
            //        btnSua.Visible = false;
            //        btnCapNhat.Visible = true;
            //        buttonThemmoi.Visible = false;
            //    }
            //    else
            //    {
            //        SetEnableForm(false);
            //        var vThietBiInfo = vDataContext.THIETBIs.Where(x => x.THIETBI_ID == pThietBiId).FirstOrDefault();
            //        if (vThietBiInfo != null)
            //        {
            //            textTenThietBi.Text = vThietBiInfo.TENTHIETBI;
            //            textMota.Text = vThietBiInfo.MOTA;
            //        }
            //    }
            //}
            //catch (Exception Ex)
            //{

            //}
        }

        /// <summary>
        /// Set trạng thái visible form
        /// </summary>
        /// <param name="pEnableStatus"></param>
        public void SetEnableForm(bool pEnableStatus)
        {         
            //textTenThietBi.Enabled = pEnableStatus;
            //textMota.Enabled = pEnableStatus;
        }

        /// <summary>
        /// Cập nhật thông tin thiết bị
        /// </summary>
        /// <param name="pThietBiId"></param>
        public void CapNhat(int pThietBiId)
        {
            try
            {
                //var cultureInfo = new CultureInfo("vi-VN");
                //CultureInfo.DefaultThreadCurrentCulture = cultureInfo;
                //CultureInfo.DefaultThreadCurrentUICulture = cultureInfo;
                //string oErrorMessage = "";

                //if (pThietBiId == 0)//Thêm mới thiết bị
                //{                                                        
                //    THIETBI vThietBiInfo = new THIETBI();
                //    vThietBiInfo.TENTHIETBI = ClassCommon.ClearHTML(textTenThietBi.Text.Trim());
                //    vThietBiInfo.MOTA = ClassCommon.ClearHTML(textMota.Text.Trim());
                //    vThietBiInfo.TRANGTHAI = 1;
                //    int oThietBiId = 0;
                //    vThietBiControllerInfo.ThemMoiThietBi(vThietBiInfo,  out oThietBiId, out oErrorMessage);   
                //    if(oThietBiId > 0)
                //    {                    
                //        string vUrl = Globals.NavigateURL("edit", "mid=" + this.ModuleId, "title=Cập nhật thông tin đơn vị", "id=" + oThietBiId);
                //        Session[vMacAddress + TabId.ToString() + "_Message"] = "Thêm mới thiết bị thành công";
                //        Session[vMacAddress + TabId.ToString() + "_Type"] = "success";
                //        Response.Redirect(vUrl);
                //    }
                //    else
                //    {
                //        ClassCommon.ShowToastr(Page, "Có lỗi trong quá trình xử lý, vui lòng liên hệ với quản trị!", "Thông báo", "error");
                //    }                                
                //}
                //else //Cập nhật thông tin thiết bị
                //{
                //    var vThietBiInfo = vDataContext.THIETBIs.Where(x => x.THIETBI_ID == pThietBiId).SingleOrDefault();
                //    if (vThietBiInfo != null)
                //    {                        
                //        vThietBiInfo.TENTHIETBI = ClassCommon.ClearHTML(textTenThietBi.Text.Trim());
                //        vThietBiInfo.MOTA = ClassCommon.ClearHTML(textMota.Text.Trim());
                //        vDataContext.SubmitChanges();                      

                //        ClassCommon.ShowToastr(Page, "Cập nhật thông tin thiết bị thành công", "Thông báo", "success");
                //        SetEnableForm(false);
                //        buttonThemmoi.Visible = true;
                //        btnCapNhat.Visible = false;
                //        btnSua.Visible = true;
                //    }
                //    else
                //    {
                //        ClassCommon.ShowToastr(Page, "Có lỗi trong quá trình xử lý, vui lòng liên hệ với quản trị!", "Thông báo", "error");
                //        textTenThietBi.Focus();
                //    }
                //}
            }
            catch (Exception ex)
            {
                //ClassCommon.THONGBAO_TOASTR(Page, ex, _currentUser, "Có lỗi trong quá trình xử lý, vui lòng liên hệ với quản trị!", "Thông báo lỗi", "error");
            }
        }

        /// <summary>
        /// Check Account Login
        /// </summary>
        public void CheckAccountLogin()
        {
            //KT account quan tri dang nhap
            if (ModulePermissionController.CanAdminModule(this.ModuleConfiguration) == false)
            {
                Response.Redirect(Globals.NavigateURL());
            }
        }


        /// <summary>
        /// Show Message
        /// </summary>
        public void ShowMessage()
        {
            //KT thong bao
            //if (!String.IsNullOrEmpty(Session[vMacAddress + TabId.ToString() + "_Message"] as string) && !String.IsNullOrEmpty(Session[vMacAddress + TabId.ToString() + "_Type"] as string))
            //{
            //    if (Session[vMacAddress + TabId.ToString() + "_Message"].ToString() != "" && Session[vMacAddress + TabId.ToString() + "_Type"].ToString() != "")
            //    {
            //        ClassCommon.THONGBAO_TOASTR(Page, null, _currentUser, Session[vMacAddress + TabId.ToString() + "_Message"].ToString(), "Thông báo", Session[vMacAddress + TabId.ToString() + "_Type"].ToString());
            //    }
            //    Session[vMacAddress + TabId.ToString() + "_Message"] = "";
            //    Session[vMacAddress + TabId.ToString() + "_Type"] = "";
            //}
        }
        #endregion

       
    }
}
