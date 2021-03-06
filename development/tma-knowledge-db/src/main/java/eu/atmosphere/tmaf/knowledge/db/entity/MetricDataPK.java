/**
 * <b>ATMOSPHERE</b> - http://www.atmosphere-eubrazil.eu/
 * ***
 * <p>
 * <b>Trustworthiness Monitoring & Assessment Framework</b>
 * Component: Knowledge - DB
 * <p>
 * Repository: https://github.com/eubr-atmosphere/tma-framework
 * License: https://github.com/eubr-atmosphere/tma-framework/blob/master/LICENSE
 * <p>
 * <p>
 */
package eu.atmosphere.tmaf.knowledge.db.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * 
 * 
 * @author Jorge Luiz <jorgem@unicamp.br>
 * @author Breno de França <breno@ic.unicamp.br>
 * @author José Pereira <josep@dei.uc.pt>
 * @author Nuno Antunes <nmsa@dei.uc.pt>
 */
@Embeddable
public class MetricDataPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "metricId")
    private int metricId;
    @Basic(optional = false)
    @Column(name = "valueTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date valueTime;

    public MetricDataPK() {
    }

    public MetricDataPK(int metricId, Date valueTime) {
        this.metricId = metricId;
        this.valueTime = valueTime;
    }

    public int getMetricId() {
        return metricId;
    }

    public void setMetricId(int metricId) {
        this.metricId = metricId;
    }

    public Date getValueTime() {
        return valueTime;
    }

    public void setValueTime(Date valueTime) {
        this.valueTime = valueTime;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) metricId;
        hash += (valueTime != null ? valueTime.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MetricDataPK)) {
            return false;
        }
        MetricDataPK other = (MetricDataPK) object;
        if (this.metricId != other.metricId) {
            return false;
        }
        if ((this.valueTime == null && other.valueTime != null) || (this.valueTime != null && !this.valueTime.equals(other.valueTime))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "eu.atmosphere.tmaf.knowledge.db.entity.MetricDataPK[ metricId=" + metricId + ", valueTime=" + valueTime + " ]";
    }
    
}
