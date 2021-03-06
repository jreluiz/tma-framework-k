package eu.atmosphere.tma.admin.database;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ActuatorManager {

    private static final Logger LOGGER = LoggerFactory.getLogger(ActuatorManager.class);

    public int saveNewActuator(String address, String pubKeyPath) {
        String sql = "INSERT INTO Actuator(address, pubKey) VALUES (?, ?)";
        PreparedStatement ps;
        byte[] pubKey = getBytesPublicKey(pubKeyPath);

        try {
            ps = DatabaseManager.getConnectionInstance().prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, address);
            ps.setString(2, Base64.getEncoder().encodeToString(pubKey));

            DatabaseManager databaseManager = new DatabaseManager();
            return databaseManager.execute(ps);
        } catch (SQLException e) {
            LOGGER.error("[ATMOSPHERE] Error when inserting an actuator in the database.", e);
        }
        return -1;
    }

    private byte[] getBytesPublicKey(String pubKeyPath) {
        InputStream input;
        try {
            input = new FileInputStream(pubKeyPath);
            byte[] pkBytes = IOUtils.toByteArray(input);
            return pkBytes;
        } catch (FileNotFoundException e) {
            LOGGER.error("[ATMOSPHERE] Public Key File not found.", e);
        } catch (IOException e) {
            LOGGER.error("[ATMOSPHERE] IOException when getting the bytes of the public key.", e);
        }
        return new byte[0];
    }
}
