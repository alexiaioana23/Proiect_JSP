package db;

import java.sql.*;

public class JavaBean {

    private Connection con;

    public JavaBean() {}

   
 // ================= CONECTARE =================
    public void connect() throws Exception {
        connect("formatii_db");
    }

    public void connect(String bd) throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/" + bd + "?useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "Nedelcu2005@"
            );
        } catch (ClassNotFoundException e) {
            throw new Exception("Driver MySQL lipsă!");
        } catch (SQLException e) {
            throw new Exception("Eroare conexiune DB!");
        }
    }

    public void disconnect() throws SQLException {
        if (con != null) con.close();
    }

    // ================= ADAUGĂRI =================

    // FORMĂȚII
    public void adaugaFormatie(String nume, String gen, int an, String tara) throws Exception {
        String sql = "INSERT INTO formatii(nume, gen_muzical, an_infiintare, tara_origine) VALUES (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nume);
        ps.setString(2, gen);
        ps.setInt(3, an);
        ps.setString(4, tara);
        ps.executeUpdate();
    }

    // MEMBRI
    public void adaugaMembru(String nume, String prenume, int varsta, String instrument, String nationalitate) throws Exception {
        String sql = "INSERT INTO membri(nume, prenume, varsta, instrument, nationalitate) VALUES (?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nume);
        ps.setString(2, prenume);
        ps.setInt(3, varsta);
        ps.setString(4, instrument);
        ps.setString(5, nationalitate);
        ps.executeUpdate();
    }

    // CONTRACT
    public void adaugaContract(int idformatie, int idmembru, Date dataStart, Date dataEnd, String status) throws Exception {
        String sql = "INSERT INTO contract(idformatie, idmembru, data_inceput, data_sfarsit, status_contract) VALUES (?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idformatie);
        ps.setInt(2, idmembru);
        ps.setDate(3, dataStart);
        ps.setDate(4, dataEnd);
        ps.setString(5, status);
        ps.executeUpdate();
    }

    // ================= SELECT =================

    public ResultSet vedeTabela(String tabela) throws Exception {
        Statement stmt = con.createStatement(
            ResultSet.TYPE_SCROLL_INSENSITIVE,
            ResultSet.CONCUR_READ_ONLY
        );
        return stmt.executeQuery("SELECT * FROM " + tabela);
    }

    // JOIN COMPLET
    public ResultSet vedeContracteComplet() throws Exception {
        String sql =
            "SELECT f.nume AS formatie, m.nume, m.prenume, " +
            "c.data_inceput, c.data_sfarsit, c.status_contract " +
            "FROM contract c " +
            "JOIN formatii f ON c.idformatie = f.idformatie " +
            "JOIN membri m ON c.idmembru = m.idmembru";

        Statement stmt = con.createStatement(
            ResultSet.TYPE_SCROLL_INSENSITIVE,
            ResultSet.CONCUR_READ_ONLY
        );
        return stmt.executeQuery(sql);
    }

    // ================= DELETE (UN SINGUR ID) =================
    public void stergeDupaID(String tabela, String coloanaID, int id) throws Exception {
        String sql = "DELETE FROM " + tabela + " WHERE " + coloanaID + " = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    // ================= DELETE (MAI MULTE ID-uri) =================
    // ⭐ METODA LIPSĂ – FOARTE IMPORTANTĂ
    public void stergeDateTabela(String[] ids, String tabela, String coloanaID) throws Exception {

        if (con == null)
            throw new Exception("Conexiune inexistentă!");

        String sql = "DELETE FROM " + tabela + " WHERE " + coloanaID + " = ?";
        PreparedStatement ps = con.prepareStatement(sql);

        for (String id : ids) {
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
        }
    }

    // ================= UPDATE =================
    public void modificaCamp(String tabela, String coloana, String valoareNoua,
                             String coloanaID, int id) throws Exception {

        String sql = "UPDATE " + tabela + " SET " + coloana + "=? WHERE " + coloanaID + "=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, valoareNoua);
        ps.setInt(2, id);
        ps.executeUpdate();
    }

    // ================= SELECT LINIE =================
    public ResultSet intoarceLinie(String tabela, String coloanaID, int id) throws Exception {
        Statement stmt = con.createStatement(
            ResultSet.TYPE_SCROLL_INSENSITIVE,
            ResultSet.CONCUR_READ_ONLY
        );
        return stmt.executeQuery(
            "SELECT * FROM " + tabela + " WHERE " + coloanaID + "=" + id
        );
    }
}
