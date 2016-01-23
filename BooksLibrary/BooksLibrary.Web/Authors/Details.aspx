<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="BooksLibrary.Web.Authors.Details" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:DetailsView runat="server" ID="AuthorDetailsView" ItemType="BooksLibrary.Models.Author"
        DataKeyNames="Id"
        AutoGenerateRows="False"
        SelectMethod="AuthorDetailsView_GetItem"
        UpdateMethod="AuthorDetailsView_UpdateItem" BorderStyle="None">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="jumbotron">
                        <h1><%#: Item.Name %></h1>
                        <p><%#: Item.Info %></p>
                        <asp:Button runat="Server" Text="Edit" CommandName="Edit" class="btn btn-primary" />
                        <asp:Button runat="Server" Text="Delete" CommandName="Delete" class="btn btn-danger " />
                        <asp:LinkButton runat="Server" Text="Cancel" PostBackUrl="~/Authors/All.aspx" class="btn btn-default" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Edit Author</legend>
                            <div class="form-group">
                                <label for="AuthorNameUpdateInput" class="col-lg-2 control-label">Name</label>
                                <div class="col-lg-10">
                                    <asp:TextBox Text="<%# BindItem.Name %>" runat="server" ID="AuthorNameUpdateInput" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="AuthorInfoUpdateInput" class="col-lg-2 control-label">Info</label>
                                <div class="col-lg-10">
                                    <asp:TextBox Text="<%# BindItem.Info %>" runat="server" ID="AuthorInfoUpdateInput" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <asp:Button runat="server" Text="Update" CommandName="Update" class="btn btn-primary" />
                                    <asp:Button runat="Server" Text="Cancel" CommandName="Cancel" class="btn btn-default" />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
