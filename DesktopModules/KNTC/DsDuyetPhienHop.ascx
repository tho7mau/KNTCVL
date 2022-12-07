﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DsDuyetPhienHop.ascx.cs" Inherits="HOPKHONGGIAY.DsDuyetPhienHop" %>
<%@ Register TagPrefix="dnnsc" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<script type="text/javascript" src="<%=vPathCommonJS %>"></script>
<script type="text/javascript">
    function Remove_tab() {
        $(".paping").each(function () {
            var $this = $(this);
            $this.html($this.html().replace(/&nbsp;/g, ''));
        });
    }
</script>

<asp:UpdateProgress ID="prgLoadingStatus" runat="server" DynamicLayout="true">
    <ProgressTemplate>
        <div id="overlay">
            <div id="modalprogress">
                <asp:Image ID="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/DesktopModules/HOPKHONGGIAY/Images/ajax-loader.gif" />
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel runat="server" ID="updatePN">
    <ContentTemplate>        
        <%--<iframe src="/DesktopModules/HOPKHONGGIAY/test.html" width="500" height="500"></iframe>--%>
<%--<object data="/DesktopModules/HOPKHONGGIAY/sodo.svg" type="image/svg+xml" width="500" height="500" />--%>


        <script type="text/javascript" language="javascript">
            Sys.Application.add_load(Remove_tab);
        </script>
        <div>
            <div id="modalPopUp" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                                <span id="spnTitle"></span>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <p>
                                <span id="spnMsg"></span>.
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Quay lại</button>
                            <button type="button" id="btnConfirm" class="btn btn-danger">
                                Có</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
          <!-- Modal nội dung phản hồi-->
        <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <span>
                            <div class="modal-title" id="exampleModalLabel"> <span style="font-family: Tahoma; font-size: 15px; color:#FFF; margin-left: 15px; font-weight: bold;">NỘI DUNG PHẢN HỒI</span>
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true" style="font-size: 21px; color: black">&times;</span>
                           </button>
                            </div>
                        </span>

                    </div>
                    <div class="modal-body" style="margin-left: 10px; margin-right: 10px">
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="15" ID="txtNoiDungPhanHoi" Width="100%"/>
                        <asp:Label runat="server" ID="lblID" Visible="false"/>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton OnClick="btnTraPhienHop_Click" type="button" CssClass="btn btn-default" runat="server" ID="btnTraPhienHop">GỬI TRẢ VỀ</asp:LinkButton>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">ĐÓNG</button>
                        
                    </div>
                </div>
            </div>
        </div>

        <%-- end--%>
        <asp:Panel ID="pnlFormDanhSach" runat="server" CssClass="form mr-b10" DefaultButton="buttonSearch">
            <div class="form-inline">
                <div class="col-right mr-b6">
                    <asp:TextBox CssClass="form-control btn-sm" OnTextChanged="btnSearch_Click" Width="400" AutoPostBack="true" ID="textSearchContent" placeholder="Nhập từ khóa..." runat="server"></asp:TextBox>
                    <asp:DropDownList Visible="true" ID="ddlistTrangThai" runat="server" OnSelectedIndexChanged="btnSearch_Click" AutoPostBack="true" CssClass="form-control slPhongBan" AppendDataBoundItems="true">
                        <asp:ListItem Selected="True" Value="-1" Text="Tất cả trạng thái" />
                        <asp:ListItem Value="3" Text="Chờ duyệt" />
                        <asp:ListItem Value="1" Text="Duyệt" />
                        <asp:ListItem Value="2" Text="Công bố" />

                    </asp:DropDownList>
                    <asp:LinkButton ID="buttonSearch" runat="server" Visible="false" CssClass="btn btn-primary btn-sm btn-search" OnClick="btnSearch_Click">
                <i class="glyphicon glyphicon-search"></i>&nbsp;Tìm
                    </asp:LinkButton>
                </div>
                <div class="col-left" runat="server">
                    <%--  <asp:LinkButton ID="btn_ThemMoi" runat="server" OnClick="btnThemMoi_Click" CssClass="btn btn-primary waves-effect none-radius none-shadow btn-sm mr-r3 min-width-100 mr-t3 mr-b6 fleft"><i class="icofont-plus"></i> Thêm mới</asp:LinkButton>--%>
                    <div id="divShowBtnXoa" style="display: none;" class="fleft">
                        <button type="button" class="btn-default btn-warning-delete btn-sm none-radius  btn min-width-100 mr-t3 mr-b3" onclick="confirm_delete_rows_update('<%=btn_Xoa.ClientID%>')"><i class="icofont-ui-delete"></i>Xóa</button>
                    </div>
                    <div style="display: none;">
                        <asp:LinkButton ID="btn_Xoa" OnClientClick="return getConfirmation(this, 'XÓA NHIỀU PHIÊN HỌP','Bạn chắc chắn muốn xóa những phiên họp đã chọn?');" CausesValidation="false" Visible="true" runat="server" CssClass="btn-default btn-sm none-radius  btn min-width-100 mr-t3 mr-b3" OnClick="btn_Xoa_Click"><i class=""></i> Xóa</asp:LinkButton>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlDanhSach" runat="server" CssClass="danhsach">
            <asp:Panel CssClass="baoloi" runat="server" ID="pnlThongBao" Visible="false">
                <asp:Label ID="lblThongBao" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:DataGrid DataKeyField="PHIENHOP_ID" runat="server" ID="dgDanhSach" OnInit="dgDanhSach_Init" AutoGenerateColumns="False" OnPageIndexChanged="dgDanhSach_PageIndexChanged" AllowPaging="True" AllowCustomPaging="False" OnItemCreated="dgDanhSach_ItemCreated"
                AllowSorting="True" OnSortCommand="dgDanhSach_SortCommand" OnItemDataBound="dgDanhSach_ItemDataBound">
                <HeaderStyle CssClass="tieude" />
                <Columns>
                    <asp:TemplateColumn HeaderText="STT" Visible="false">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll" runat="server" onclick="handle_checked_delete_all_rows(this,'divShowBtnXoa');" />
                        </HeaderTemplate>
                        <HeaderStyle Width="3%" />
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" Width="3%" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRow" runat="server" onclick="handle_checked_delete_row(this,'divShowBtnXoa');" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn HeaderText="PHIENHOP_ID" DataField="PHIENHOP_ID" Visible="false">
                        <ItemStyle HorizontalAlign="Left" />
                        <HeaderStyle />
                    </asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Tiêu đề" HeaderStyle-HorizontalAlign="Left" SortExpression="TIEUDE">
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <a runat="server" id="linkChiTiet" title="Xem chi tiết phiên họp" href='<%# DataBinder.Eval(Container,"DataItem.PHIENHOP_ID") %>' onserverclick="XemChiTietPhienHop">
                                <%# DataBinder.Eval(Container, "DataItem.TIEUDE") %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:BoundColumn ItemStyle-Width="15%" SortExpression="THOIGIANBATDAU" HeaderText="Thời gian bắt đầu" DataField="THOIGIANBATDAU" DataFormatString="{0:dd/MM/yyyy hh:mm}" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>

                    <asp:BoundColumn ItemStyle-Width="15%" SortExpression="THOIGIANKETTHUC" HeaderText="Thời gian kết thúc" DataField="THOIGIANKETTHUC" DataFormatString="{0:dd/MM/yyyy hh:mm}" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>

                    <asp:TemplateColumn ItemStyle-Width="15%" HeaderText="Phòng họp" Visible="true" HeaderStyle-HorizontalAlign="Left">
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# GetTenPhongHop(int.Parse(DataBinder.Eval(Container, "DataItem.PHIENHOP_ID").ToString())) != null ? GetTenPhongHop(int.Parse(DataBinder.Eval(Container, "DataItem.PHIENHOP_ID").ToString())) : "<span class='orange'>Chưa chọn phòng</span>" %>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn ItemStyle-Width="10%" HeaderText="Trạng thái" Visible="true" HeaderStyle-HorizontalAlign="Left" SortExpression="TRANGTHAI">
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                                    <%#DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "3" ? "<span class='orange'>Chờ duyệt</span>":
                                    (DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "4" ? "<span class='orange'>Đang họp</span>" :
                                    (DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "5" ? "<span class='red'>Đã họp</span>" :
                                    (DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "1" ? "<span class='blue'>Duyệt</span>" :
                                    (DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "2"? "<span class='green'>Công bố</span>" : "")))) %>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                       <asp:TemplateColumn ItemStyle-Width="4%" HeaderText="Trả về" Visible="true" HeaderStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                           <a onserverclick="dgTraVe" href='<%# DataBinder.Eval(Container,"DataItem.PHIENHOP_ID")%>' runat="server">
                            <span style='<%#DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "4" ? "display:none" :
                                    DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "5" ? "display:none" :                                 
                                    DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "2"? "display:none" : "" %>'>
                                <i class="icofont-reply color-yellow"></i>
                               </span>
                            </a>        
                        </ItemTemplate>
                    </asp:TemplateColumn>



                    <asp:TemplateColumn HeaderText="Duyệt">
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                        <ItemTemplate>
                            <a id="lnkDuyet" href='<%# DataBinder.Eval(Container,"DataItem.PHIENHOP_ID") %>' onserverclick="lnkDuyet_ServerClick" runat="server">
                                <%# DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "1" ? "<span class='glyphicon glyphicon-ok' title='Bỏ duyệt phiên họp' style='color:#008000;'></span>" : 
                                     DataBinder.Eval(Container, "DataItem.TRANGTHAI").ToString() == "3" ?  "<span style='color:red;' title='Duyệt phiên họp' class='glyphicon glyphicon-minus-sign'></span>":"" %>                                                        
                            </a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Chọn phòng" Visible="false">
                        <HeaderStyle Width="5%" />
                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a onserverclick="dgDanhSach_ChonPhong" title="Chọn phòng cho phiên họp" style='<%# (Eval("TRANGTHAI").ToString() == "2" || Eval("TRANGTHAI").ToString() == "3" || Eval("TRANGTHAI").ToString() == "4" || Eval("TRANGTHAI").ToString() == "5") ? "display:none": ""  %>' href='<%# Eval("PHIENHOP_ID").ToString() %>' oncontextmenu="return false" runat="server"><i class="icofont-black-board fz18" style="color: #0182c6"></i></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Công bố">
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                        <ItemTemplate>
                            <a id="lnkKichHoat" title="Công bố phiên họp" href='<%# DataBinder.Eval(Container,"DataItem.PHIENHOP_ID") %>' style='<%# (Eval("TRANGTHAI").ToString() == "2" || Eval("TRANGTHAI").ToString() == "3" || Eval("TRANGTHAI").ToString() == "4" || Eval("TRANGTHAI").ToString() == "5") ? "display:none": ""  %>' onserverclick="TrangThai_Click" runat="server">
                                <i class="icofont-external-link fz18" style="color: #00b300"></i>
                            </a>

                            <a id="lnkHuyKichHoat" title="Hủy công bố" href='<%# DataBinder.Eval(Container,"DataItem.PHIENHOP_ID") %>' style='<%# (Eval("TRANGTHAI").ToString() == "2" ) ? "": "display:none"  %>' onserverclick="TrangThai_Click" runat="server">
                                <i class="icofont-reply fz18" style="color: red"></i>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Sửa" Visible="false">
                        <HeaderStyle Width="5%" />
                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a onserverclick="dgDanhSach_Sua" title="Cập nhật thông tin phiên họp" style='<%# (Eval("TRANGTHAI").ToString() == "2" || Eval("TRANGTHAI").ToString() == "5") ? "display:none": ""  %>' class="icon-sua" href='<%# Eval("PHIENHOP_ID").ToString() %>' oncontextmenu="return false" runat="server"></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Xóa" Visible="false">
                        <HeaderStyle Width="5%" />
                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a onserverclick="dgDanhSach_Xoa" title="Xóa phiên họp" class="icon-xoa" onclick="return getConfirmation(this, 'XÓA PHIÊN HỌP','Bạn muốn xóa phiên họp này?');" href='<%# Eval("PHIENHOP_ID").ToString()%>' oncontextmenu="return false" runat="server"></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle Mode="NumericPages" CssClass="paping" PageButtonCount="9999"></PagerStyle>
            </asp:DataGrid>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>

<style>
    .form .form-inline .col-left {
        float: left;
    }
 
    .danhsach table tbody tr.paping td select {
        float: right;
    }

    .icon-home-plus {
        width: 20px;
        height: 20px;
        color: aqua;
    }
    .color-yellow{
        color:#ff6600;       
    }
</style>
<script type="text/javascript">
    function getConfirmation(sender, title, message) {
        $("#spnTitle").text(title);
        $("#spnMsg").text(message);
        $('#modalPopUp').modal('show');
        $('#btnConfirm').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 50);");
        return false;
    }
    function ConfirmDelete() {
        return confirm("Bạn muốn xóa dữ liệu này ?");
    }
    function ConfirmActive() {
        return confirm("Bạn muốn thay đổi trạng thái quốc gia?");
    }
    function ConfirmDelete() {
        return confirm("Bạn muốn xóa dữ liệu này ?");
    }  
    // Mở popUp thông tin thanh toán
    function ShowPopUp() {
        $('#exampleModal').modal('show');
        return true;
    }  
</script>
