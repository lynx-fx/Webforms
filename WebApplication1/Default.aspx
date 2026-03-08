<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="text-center mb-5 pb-3 border-bottom">
            <h1 class="display-5 fw-bold text-dark mb-3"><i class="bi bi-camera-reels"></i> Management Dashboard</h1>
            <p class="lead text-secondary">A centralized administrative interface for cinema operations and schedule
                management.</p>
        </div>

        <div class="row g-4 justify-content-center">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border neutral-card">
                    <div class="card-body text-center p-4">
                        <div class="display-5 text-dark mb-3"><i class="bi bi-people"></i></div>
                        <h5 class="card-title fw-semibold">User Directory</h5>
                        <p class="card-text text-muted mb-4 small">Manage registered administrators, staff, and customer
                            accounts.</p>
                        <a href="/basic/user.aspx" class="btn btn-outline-dark px-4 rounded-0">Manage Users</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm border neutral-card">
                    <div class="card-body text-center p-4">
                        <div class="display-5 text-dark mb-3"><i class="bi bi-ticket-perforated"></i></div>
                        <h5 class="card-title fw-semibold">Ticketing System</h5>
                        <p class="card-text text-muted mb-4 small">Oversee active ticket allocations, booking
                            references, and limits.</p>
                        <a href="/basic/ticket.aspx" class="btn btn-outline-dark px-4 rounded-0">View Tickets</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm border neutral-card">
                    <div class="card-body text-center p-4">
                        <div class="display-5 text-dark mb-3"><i class="bi bi-calendar-event"></i></div>
                        <h5 class="card-title fw-semibold">Show Scheduling</h5>
                        <p class="card-text text-muted mb-4 small">Configure movie timings across designated theater
                            halls.</p>
                        <a href="/basic/show.aspx" class="btn btn-outline-dark px-4 rounded-0">Manage Shows</a>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .neutral-card {
                border-radius: 4px;
                border-color: #ddd;
                transition: all 0.2s ease-in-out;
            }

            .neutral-card:hover {
                border-color: #6c757d;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08) !important;
                transform: translateY(-3px);
            }

            .btn-outline-dark {
                letter-spacing: 0.5px;
                text-transform: uppercase;
                font-size: 0.85rem;
                font-weight: 500;
            }
        </style>
    </asp:Content>