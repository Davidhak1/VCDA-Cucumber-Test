package resources;


import model.IMDBVehicle;


import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class Queries {



    private MysqlCon mysqlCon= new MysqlCon();

    public IMDBVehicle getVehicleByUUID(String uuid) {
        Statement stmt = mysqlCon.getStatement();

        try {
            ResultSet rs = stmt.executeQuery(String.format("select * from vehicle where uuid = '%s';", uuid));

            while (rs.next()) {
                return new IMDBVehicle(rs.getLong(1), rs.getInt(2),rs.getString(3),rs.getString(4),
                        rs.getString(5), rs.getString(6),rs.getString(8),rs.getString(9),
                        rs.getInt(10), rs.getString(11), rs.getString(12),rs.getString(13));

            }

        }catch (Exception e){
            System.out.println("------------------EXCEPTION IN THE QUERIES CLASS-------------------");
            e.printStackTrace();
        }

        finally{
            mysqlCon.endCon();
        }
        System.out.println("No vehicle found with 'uuid' - "+uuid);
        return null;
    }

    public List<IMDBVehicle> getAllVehiclesWithLimit(int limit) {
        Statement stmt = mysqlCon.getStatement();
        List<IMDBVehicle> vehicles = new ArrayList<IMDBVehicle>();

        try {
            ResultSet rs = stmt.executeQuery(String.format("select * from vehicle limit %d;", limit));

            while (rs.next()) {
                vehicles.add(new IMDBVehicle(rs.getLong(1), rs.getInt(2),rs.getString(3),rs.getString(4),
                        rs.getString(5), rs.getString(6),rs.getString(8),rs.getString(9),
                        rs.getInt(10), rs.getString(11), rs.getString(12),rs.getString(13)));

            }

            if(vehicles.size()>0)
                return vehicles;
        }catch (Exception e){
            System.out.println("------------------EXCEPTION IN THE QUERIES CLASS-------------------");
            e.printStackTrace();
        }
        finally{
            mysqlCon.endCon();
        }

        System.out.println("No vehicle found");
        return null;
    }

    public IMDBVehicle getVehicleByVin(String vin) {
        Statement stmt = mysqlCon.getStatement();

        try {
            ResultSet rs = stmt.executeQuery(String.format("select * from vehicle where vin = '%s';", vin));

            while (rs.next()) {
                return new IMDBVehicle(rs.getLong(1), rs.getInt(2),rs.getString(3),rs.getString(4),
                        rs.getString(5), rs.getString(6),rs.getString(8),rs.getString(9),
                        rs.getInt(10), rs.getString(11), rs.getString(12),rs.getString(13));

            }

        }catch (Exception e){
            System.out.println("------------------EXCEPTION IN THE QUERIES CLASS--------------------");
            e.printStackTrace();
        }

        finally{
            mysqlCon.endCon();
        }
        System.out.println("No vehicle found with 'vin' - "+vin);
        return null;
    }

    public List<IMDBVehicle> getVehiclesByAccountId(String accountId) {
        Statement stmt = mysqlCon.getStatement();
        List<IMDBVehicle> vehicles = new ArrayList<IMDBVehicle>();
        try {
            ResultSet rs = stmt.executeQuery(String.format("select * from vehicle where accountId = '%s';", accountId));


            while (rs.next()) {
                vehicles.add(new IMDBVehicle(rs.getLong(1), rs.getInt(2),rs.getString(3),rs.getString(4),
                        rs.getString(5), rs.getString(6),rs.getString(8),rs.getString(9),
                        rs.getInt(10), rs.getString(11), rs.getString(12),rs.getString(13)));
            }

            if(vehicles.size()>0)
                return vehicles;
        }catch (Exception e){
            System.out.println("------------------EXCEPTION IN THE QUERIES CLASS-------------------");
            e.printStackTrace();
        }
        finally{
            mysqlCon.endCon();
        }

        System.out.println("No vehicle found with 'accountId' - " + accountId);
        return null;
    }



}