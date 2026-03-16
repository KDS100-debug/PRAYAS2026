# PRAYAS 2026 - Deployment Configuration Guide

## Service Metadata

| Property | Value |
|----------|-------|
| Service Type | Web Service |
| Service Name | PRAYAS2026 |
| Runtime | Python 3 |
| Plan Tier | Free |
| Service ID | srv-d62rdmu8alac738mgi6g |

## Source Control Configuration

| Property | Value |
|----------|-------|
| Repository | prayasadyavanchakra-spec / PRAYAS2026 |
| Branch | main |
| Deployment Endpoint | https://prayas2026.onrender.com |

## Operational Status

- Instance configured on free tier; auto spin-down enabled during inactivity with potential cold-start latency exceeding 50 seconds
- Deployment currently blocked due to empty repository state

## Required Remediation

1. Commit application source files to the repository
2. Push to main branch
3. Trigger deployment via Manual Deploy → Deploy latest commit

## Available Platform Controls

### Monitoring
- Logs
- Metrics

### Management
- Environment Variables
- Shell Access
- Scaling Controls
- Preview Environments

## Deployment Process

### Prerequisites
- Repository contains application source files
- All files committed to main branch on GitHub
- Service ID: srv-d62rdmu8alac738mgi6g is active

### Critical Issues to Address
The deployment is currently blocked. To proceed:

1. **Commit application source files**
   - Push all source code to repository
   - Ensure files are on main branch

2. **Trigger deployment**
   - Access Render dashboard
   - Navigate to Manual Deploy section
   - Select "Deploy latest commit"

### Environment Configuration Required

Set the following environment variables in Render dashboard:

```
FLASK_ENV=production
MYSQL_HOST=<your-hostinger-host>
MYSQL_USER=<your-username>
MYSQL_PASSWORD=<your-password>
MYSQL_DB=prayas2026
SECRET_KEY=<secure-random-key>
CORS_ORIGINS=<your-frontend-domain>
```

## Platform Monitoring & Controls

Access the following controls via Render dashboard:

### Monitoring
- View deployment logs in real-time
- Track application metrics
- Monitor resource utilization

### Management
- Configure environment variables
- Access shell for debugging
- Manage service scaling
- Create preview environments

## Health Check Endpoint

Test service status at:
```
https://prayas2026.onrender.com/api/health
```

Expected response:
```json
{
  "status": "healthy",
  "service": "PRAYAS2026",
  "timestamp": "2026-02-06T09:43:17.361Z"
}
```

## Deployment Best Practices

### Before Deployment
1. Verify all source files are committed
2. Confirm main branch contains latest code
3. Validate environment variables are set
4. Test locally if possible

### During Deployment
1. Monitor logs for errors
2. Check deployment status
3. Verify health check passes

### After Deployment
1. Test API endpoints
2. Verify database connectivity
3. Check cold-start performance
4. Monitor error rates

## Cold Start Considerations

This free tier service includes auto spin-down during inactivity:
- First request after inactivity may experience 50+ second delay
- Subsequent requests perform normally
- Consider implementing health check monitoring
- Plan user communication for potential latency

## Troubleshooting

### Deployment Blocked Issues
- Ensure repository is not empty
- Verify source files are committed to main branch
- Check Service ID matches configuration
- Review manual deploy option in dashboard

### Environment Variable Issues
- Confirm all required variables are set
- Verify variable values are correct
- Check for whitespace or special characters
- Use dashboard UI to manage variables

### Performance Issues
- Check logs for error messages
- Monitor cold-start metrics
- Verify database connectivity
- Review application error rates

---

**Last Updated**: February 6, 2026, 09:43:17 UTC
**Service ID**: srv-d62rdmu8alac738mgi6g
**Service Name**: PRAYAS2026
**Deployment Endpoint**: https://prayas2026.onrender.com
**Repository**: prayasadyavanchakra-spec/PRAYAS2026
**Branch**: main
**Current Status**: Deployment blocked - awaiting repository population
**Version**: 2.0.0
