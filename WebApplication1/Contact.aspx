<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="mb-5 pb-2 border-bottom">
            <h2 id="title" class="text-dark fw-bold"><i class="bi bi-envelope me-2"></i> Contact & Support</h2>
            <p class="text-secondary small">Official contact points for CineManage administrative and technical support.
            </p>
        </div>

        <div class="row g-4">
            <div class="col-md-6">
                <div class="card h-100 border">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-3"><i class="bi bi-geo-alt me-2"></i> Head Office</h5>
                        <address class="text-secondary mb-0">
                            CineManage Corporate HQ<br />
                            KTM, Nepal<br />
                            <span class="d-block mt-2"><abbr title="Phone" class="text-dark fw-bold">P:</abbr> +977 01
                                4440100</span>
                        </address>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card h-100 border">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-3"><i class="bi bi-chat-dots me-2"></i> Communications</h5>
                        <div class="mb-2">
                            <strong class="text-dark">Support Enquiries:</strong><br />
                            <a href="mailto:support@cinemanage.com"
                                class="text-muted text-decoration-none">support@cinemanage.com</a>
                        </div>
                        <div>
                            <strong class="text-dark">Administrative:</strong><br />
                            <a href="mailto:admin@cinemanage.com"
                                class="text-muted text-decoration-none">admin@cinemanage.com</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>