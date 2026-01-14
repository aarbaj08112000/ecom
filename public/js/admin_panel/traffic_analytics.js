$(document).ready(function () {
    initCharts();

    function initCharts() {
        $.ajax({
            url: cleanBaseUrl + "report/report/get_traffic_chart_data",
            type: "GET",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    renderTrafficTrend(response.daily);
                    renderDeviceDistribution(response.devices);
                }
            }
        });
    }

    function renderTrafficTrend(data) {
        const ctx = document.getElementById('trafficTrendChart').getContext('2d');
        if (!ctx) return;

        let gradient = ctx.createLinearGradient(0, 0, 0, 400);
        gradient.addColorStop(0, 'rgba(67, 97, 238, 0.3)');
        gradient.addColorStop(1, 'rgba(67, 97, 238, 0)');

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: data.map(item => item.date),
                datasets: [
                    {
                        label: 'Page Views',
                        data: data.map(item => item.views),
                        borderColor: '#4361ee',
                        backgroundColor: gradient,
                        borderWidth: 3,
                        tension: 0.4,
                        fill: true,
                        pointBackgroundColor: '#fff',
                        pointBorderColor: '#4361ee',
                        pointRadius: 4
                    },
                    {
                        label: 'Unique Visitors',
                        data: data.map(item => item.unique_visitors),
                        borderColor: '#4cc9f0',
                        borderWidth: 2,
                        borderDash: [5, 5],
                        fill: false,
                        pointRadius: 2
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    tooltip: { mode: 'index', intersect: false }
                },
                scales: {
                    y: { beginAtZero: true, grid: { borderDash: [4, 4] } },
                    x: { grid: { display: false } }
                }
            }
        });
    }

    function renderDeviceDistribution(data) {
        const ctx = document.getElementById('deviceDistChart').getContext('2d');
        if (!ctx) return;

        new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: data.map(item => item.device_type),
                datasets: [{
                    data: data.map(item => item.count),
                    backgroundColor: ['#4361ee', '#4cc9f0', '#f72585'],
                    borderWidth: 0,
                    hoverOffset: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom' }
                },
                cutout: '70%'
            }
        });
    }
});
