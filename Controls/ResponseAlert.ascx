<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResponseAlert.ascx.cs" Inherits="ResponseAlert" %>
<div class="row" id="AlertContiner" runat="server" visible="false">
                <div class="col-md-12"><%--aria-hidden="true"--%>
                    <div class="alert alert-danger alert-dismissable text-center" runat="server" id="AlertDiv">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span >&times;</span></button>
                        <asp:Literal runat="server" ID="AlertMessage"></asp:Literal>
                    </div>
                </div>
</div>