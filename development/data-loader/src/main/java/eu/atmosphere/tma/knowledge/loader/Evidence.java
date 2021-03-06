/**
 * <b>ATMOSPHERE</b> - http://www.atmosphere-eubrazil.eu/
 * ***
 * <p>
 * <b>Trustworthiness Monitoring & Assessment Framework</b>
 * Component: Knowledge - DataLoader
 * <p>
 * Repository: https://github.com/eubr-atmosphere/tma-framework
 * License: https://github.com/eubr-atmosphere/tma-framework/blob/master/LICENSE
 * <p>
 * <p>
 */
package eu.atmosphere.tma.knowledge.loader;

/**
 * This class stores Evidences to be added to the Data table in the Knowledge.
 * In practice, an {@link Evidence} is an {@link Observation} with the complete
 * detail.
 * <p>
 *
 * @author Paulo Goncalves  <pgoncalves@student.dei.uc.pt>
 * @author Rui Silva        <rfsilva@student.dei.uc.pt>
 * @author Jose Pereira     <josep@dei.uc.pt>
 * @author Nuno Antunes     <nmsa@dei.uc.pt>
 */
public class Evidence {

    private int probeId;
    private int resourceId;
    private int descriptionId;
    private int metricId;
    private double time;
    private double value;

    public Evidence(int probeId, int resourceId, int descriptionId, int metricId, double time, double value) {
        this.probeId = probeId;
        this.resourceId = resourceId;
        this.descriptionId = descriptionId;
        this.metricId = metricId;
        this.time = time;
        this.value = value;
    }

    public int getProbeId() {
        return probeId;
    }

    public int getResourceId() {
        return resourceId;
    }

    public int getDescriptionId() {
        return descriptionId;
    }
    
    public int getMetricId() {
		return metricId;
	}

	public double getTime() {
        return time;
    }

    public double getValue() {
        return value;
    }

    public void setProbeId(int probeId) {
        this.probeId = probeId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public void setDescriptionId(int descriptionId) {
        this.descriptionId = descriptionId;
    }

	public void setMetricId(int metricId) {
		this.metricId = metricId;
	}
    
    public void setTime(double time) {
        this.time = time;
    }

    public void setValue(double value) {
        this.value = value;
    }

	@Override
	public String toString() {
		return "Evidence [probeId=" + probeId + ", resourceId=" + resourceId + ", descriptionId=" + descriptionId
				+ ", metricId=" + metricId + ", time=" + time + ", value=" + value + "]";
	}


}
