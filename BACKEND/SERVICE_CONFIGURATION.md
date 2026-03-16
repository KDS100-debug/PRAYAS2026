# PRAYAS 2026 - Service Configuration

**Last Updated**: February 6, 2026, 09:43:17 UTC

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

- Instance configured on free tier; auto spin-down enabled during inactivity with potential cold-start latency exceeding 50 seconds.
- Deployment currently blocked due to empty repository state.

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

## Cold Start Behavior

On the free tier, the service will spin down automatically during inactivity periods:

- **Idle Period**: After approximately 15 minutes of no activity, the service stops
- **Reactivation Time**: When a request arrives, the service needs 50+ seconds to restart
- **Performance After Startup**: Full speed operation once running
- **Cost Impact**: Free tier - no additional charges

### Mitigation Strategies

1. **Scheduled Health Checks**: Set up periodic monitoring to keep service alive
2. **User Communication**: Inform users of potential initial latency
3. **Progressive Startup**: Implement loading indicators for first request
4. **Request Batching**: Consolidate requests to minimize restart triggers

## Deployment Procedure

### Prerequisites

- All source files committed to repository
- Files located on main branch
- Service ID srv-d62rdmu8alac738mgi6g is active

### Steps to Deploy

1. **Push Source Files**
   ```bash
   git push origin main
   ```

2. **Access Render Dashboard**
   - Navigate to https://render.com
   - Find service with ID: srv-d62rdmu8alac738mgi6g

3. **Manual Deployment**
   - Click "Manual Deploy" button
   - Select "Deploy latest commit"
   - Monitor logs for success

4. **Verify Health**
   ```bash
   curl https://prayas2026.onrender.com/api/health
   ```

## Environment Variables

Required environment variables for deployment:

```
FLASK_ENV=production
MYSQL_HOST=<database-host>
MYSQL_USER=<database-user>
MYSQL_PASSWORD=<database-password>
MYSQL_DB=prayas2026
SECRET_KEY=<secure-random-key>
CORS_ORIGINS=<frontend-domain>
```

## Monitoring

Access the following via Render dashboard:

- **Logs**: View real-time application logs
- **Metrics**: Monitor resource utilization and performance
- **Shell Access**: Debug issues directly in production
- **Environment Variables**: Manage configuration securely

## Support Resources

- **Render Documentation**: https://render.com/docs
- **Service Dashboard**: https://render.com/d/svc/srv-d62rdmu8alac738mgi6g
- **Status Page**: https://render.com/status

## Version History

- **v2.0.0** (Feb 6, 2026): Updated with authoritative configuration
- **v1.0.0** (Feb 6, 2026): Initial configuration
