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
            <div class="jumbotron">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                        <asp:LinkButton Text="Sort By Title" CommandArgument="Title" CssClass="btn btn-default" CommandName="Sort" runat="server" />
                        <asp:LinkButton Text="Sort By Date" CommandArgument="DateAdded" CssClass="btn btn-default" CommandName="Sort" runat="server" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 pull-right">
                        <asp:TextBox ID="tbFilter" placeholder="Filter By Title" CssClass="form-control" runat="server" />
                        <asp:Button Text="Filter" OnClick="Filter" ID="btnFilter" CssClass="btn btn-default" runat="server" />
                    </div>
                </div>
            </div>
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
                    <img class="group list-group-image" src="<%#:Item.ImageUrl %>" alt="">
                    <div class="caption">
                        <h4 class="group inner list-group-item-heading"><%# Item.Title  %></h4>
                        <p class="group inner list-group-item-text">Category: <%# Item.Category.Name  %></p>
                        <p class="group inner list-group-item-text">Author: <%# Item.Author.Name  %></p>
                        <p class="group inner list-group-item-text">Added: <%# Item.DateAdded  %></p>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                <a class="btn btn-info" href="/Books/Details?id=<%#:Item.Id %>">Book Details</a>
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

