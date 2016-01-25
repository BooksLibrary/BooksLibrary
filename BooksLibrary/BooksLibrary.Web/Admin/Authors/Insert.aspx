<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Insert.aspx.cs" Inherits="BooksLibrary.Web.Admin.Authors.Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <fieldset class="form-horizontal">
        <legend>Legend</legend>
        <div class="form-group">
            <label for="AuthorNameInput" class="col-lg-2 control-label">Name</label>
            <div class="col-lg-10">
                <asp:TextBox runat="server" ID="AuthorNameInput" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="AuthorInfoInput" class="col-lg-2 control-label">Info</label>
            <div class="col-lg-10">
                <asp:TextBox TextMode="MultiLine" runat="server" ID="AuthorInfoInput" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="AuthorImageInput" class="col-lg-2 control-label">Image</label>
            <div class="col-lg-10">
                <asp:FileUpload runat="server" ID="AuthorImageInput" class="form-control"></asp:FileUpload>
            </div>
        </div>
        <div class="form-group">
            <label for="AuthorInfoInput" class="col-lg-2 control-label">Email</label>
            <div class="col-lg-10">
                <asp:Button runat="server" ID="CreateAuthor" class="btn btn-primary" OnClick="CreateAuthor_Click"></asp:Button>
            </div>
        </div>
    </fieldset>
</asp:Content>
