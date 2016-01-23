<%@ Page Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Books.All" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Books </h1>
    <asp:ListView ID="BooksListView"
        SelectMethod="BooksListView_GetData"
        InsertItemPosition="LastItem"
        ItemType="BooksLibrary.Models.Book"
        DataKeyNames="Id"
        runat="server">
        <LayoutTemplate>
            <div id="portfolio" class="row">
                <div class="col-md-3" runat="server" id="itemPlaceholder"></div>
            </div>
            <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="BooksListView" PageSize="6" class="pagination">
                <Fields>
                    <asp:NumericPagerField ButtonType="Link" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="item  col-xs-4 col-lg-4">
                <div class="thumbnail">
                    <img class="group list-group-image" src="http://www.text2image.com/user_images/text2image_T84439_20160123_153545.jpg" alt="">
                    <div class="caption">
                        <h4 class="group inner list-group-item-heading"><%# Item.Title  %></h4>
                        <p class="group inner list-group-item-text"><%# Item.Description  %></p>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                <a class="btn btn-info" href="http://telerikacademy.com/">Book Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <InsertItemTemplate>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>

