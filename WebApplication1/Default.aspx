<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        
        <div class="dashboard-header mb-5">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <h1 class="dashboard-title">CineManage Dashboard</h1>
                    <p class="dashboard-subtitle text-secondary">A comprehensive suite for managing cinema operations, bookings, and schedules with real-time insights.</p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <div class="current-date p-2 bg-light rounded-pill px-4 d-inline-block border shadow-sm">
                        <i class="bi bi-calendar3 me-2 text-primary"></i> <span id="currentDate"><%: DateTime.Now.ToString("MMMM dd, yyyy") %></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-divider mb-4">
            <h4 class="fw-bold text-dark"><i class="bi bi-grid-fill text-primary me-2"></i> Core Management</h4>
            <p class="text-muted small">Maintain base records and system configurations.</p>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-lg-2-4 col-md-4 col-sm-6">
                <a href="/basic/user.aspx" class="feature-link">
                    <div class="feature-card card h-100 shadow-sm border-0 rounded-4">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon mb-3 bg-blue"><i class="bi bi-person-badge"></i></div>
                            <h6 class="fw-bold mb-1">Users</h6>
                            <p class="text-muted extra-small">Staff & Admins</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-2-4 col-md-4 col-sm-6">
                <a href="/basic/movies.aspx" class="feature-link">
                    <div class="feature-card card h-100 shadow-sm border-0 rounded-4">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon mb-3 bg-purple"><i class="bi bi-camera-reels"></i></div>
                            <h6 class="fw-bold mb-1">Movies</h6>
                            <p class="text-muted extra-small">Catalog & Media</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-2-4 col-md-4 col-sm-6">
                <a href="/basic/ticket.aspx" class="feature-link">
                    <div class="feature-card card h-100 shadow-sm border-0 rounded-4">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon mb-3 bg-green"><i class="bi bi-ticket-detailed"></i></div>
                            <h6 class="fw-bold mb-1">Tickets</h6>
                            <p class="text-muted extra-small">Pricing & Tiering</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-2-4 col-md-4 col-sm-6">
                <a href="/basic/show.aspx" class="feature-link">
                    <div class="feature-card card h-100 shadow-sm border-0 rounded-4">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon mb-3 bg-orange"><i class="bi bi-calendar-check"></i></div>
                            <h6 class="fw-bold mb-1">Shows</h6>
                            <p class="text-muted extra-small">Time Scheduling</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-2-4 col-md-4 col-sm-6">
                <a href="/basic/theatercityhall.aspx" class="feature-link">
                    <div class="feature-card card h-100 shadow-sm border-0 rounded-4">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon mb-3 bg-teal"><i class="bi bi-building"></i></div>
                            <h6 class="fw-bold mb-1">Theaters</h6>
                            <p class="text-muted extra-small">Locations & Halls</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="section-divider mb-4">
            <h4 class="fw-bold text-dark"><i class="bi bi-cpu-fill text-danger me-2"></i> Advanced Operations</h4>
            <p class="text-muted small">Complex data management and relational operations.</p>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 complex-card shadow-sm border-0 rounded-4 overflow-hidden">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="complex-icon bg-danger-subtle text-danger"><i class="bi bi-person-vcard"></i></div>
                            <span class="badge bg-danger-subtle text-danger rounded-pill px-3">Complex</span>
                        </div>
                        <h5 class="fw-bold">User's Ticket</h5>
                        <p class="card-text text-muted small mb-4">Relate ticketing data with specific user accounts for detailed history and tracking.</p>
                        <a href="/complex/usersTicket.aspx" class="btn btn-danger w-100 rounded-pill py-2 fw-semibold">Access Form <i class="bi bi-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 complex-card shadow-sm border-0 rounded-4 overflow-hidden">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="complex-icon bg-indigo-subtle text-indigo"><i class="bi bi-grid-3x3-gap"></i></div>
                            <span class="badge bg-indigo-subtle text-indigo rounded-pill px-3">Complex</span>
                        </div>
                        <h5 class="fw-bold">Movie Hall Mapping</h5>
                        <p class="card-text text-muted small mb-4">Advanced hall assignments and capacity management for ongoing movie screenings.</p>
                        <a href="/complex/movieHall.aspx" class="btn btn-indigo w-100 rounded-pill py-2 fw-semibold">Configure Halls <i class="bi bi-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 complex-card shadow-sm border-0 rounded-4 overflow-hidden">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="complex-icon bg-dark-subtle text-dark"><i class="bi bi-bar-chart-steps"></i></div>
                            <span class="badge bg-dark-subtle text-dark rounded-pill px-3">Complex</span>
                        </div>
                        <h5 class="fw-bold">Performance Analytics</h5>
                        <p class="card-text text-muted small mb-4">Analyze hall performance, occupancy rates, and show success metrics.</p>
                        <a href="/complex/performance.aspx" class="btn btn-dark w-100 rounded-pill py-2 fw-semibold">View Analytics <i class="bi bi-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <style>
            :root {
                --indigo: #6610f2;
                --teal: #20c997;
                --orange: #fd7e14;
                --purple: #6f42c1;
                --blue: #0d6efd;
            }

            body {
                font-family: 'Inter', sans-serif !important;
                background-color: #f8f9fa;
            }

            .dashboard-title {
                font-weight: 800;
                color: #212529;
                letter-spacing: -1px;
                font-size: 2.5rem;
            }

            .dashboard-subtitle {
                font-size: 1.1rem;
                max-width: 600px;
            }

            .stat-card {
                background: white;
                transition: transform 0.2s;
            }
            .stat-card:hover {
                transform: translateY(-5px);
            }
            .stat-icon {
                width: 50px;
                height: 50px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
            }

            .feature-link {
                text-decoration: none;
                color: inherit;
            }

            .feature-card {
                transition: all 0.3s ease;
                border: 1px solid rgba(0,0,0,0.05) !important;
            }

            .feature-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important;
                border-color: rgba(0,0,0,0.1) !important;
            }

            .feature-icon {
                width: 60px;
                height: 60px;
                margin: 0 auto;
                border-radius: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.8rem;
                color: white;
                box-shadow: 0 8px 15px rgba(0,0,0,0.1);
            }

            .bg-blue { background: linear-gradient(135deg, #0d6efd, #0b5ed7); }
            .bg-purple { background: linear-gradient(135deg, #6f42c1, #59359a); }
            .bg-green { background: linear-gradient(135deg, #198754, #146c43); }
            .bg-orange { background: linear-gradient(135deg, #fd7e14, #ca6510); }
            .bg-teal { background: linear-gradient(135deg, #20c997, #19a179); }

            .extra-small { font-size: 0.75rem; }

            .complex-card {
                border: 1px solid rgba(0,0,0,0.05) !important;
                transition: all 0.3s;
            }
            .complex-card:hover {
                box-shadow: 0 20px 40px rgba(0,0,0,0.08) !important;
            }

            .complex-icon {
                width: 48px;
                height: 48px;
                border-radius: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.4rem;
            }

            .btn-indigo {
                background-color: var(--indigo);
                color: white;
            }
            .btn-indigo:hover {
                background-color: #520dc2;
                color: white;
            }

            .text-indigo { color: var(--indigo); }
            .bg-indigo-subtle { background-color: #e0d1ff; }

            .col-lg-2-4 {
                flex: 0 0 auto;
                width: 20%;
            }

            @media (max-width: 992px) {
                .col-lg-2-4 {
                    width: 33.33%;
                }
            }
            @media (max-width: 768px) {
                .col-lg-2-4 {
                    width: 50%;
                }
            }
        </style>
    </asp:Content>