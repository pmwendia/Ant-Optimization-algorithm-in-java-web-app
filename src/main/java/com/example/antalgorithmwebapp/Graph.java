package com.example.antalgorithmwebapp;

import jakarta.servlet.*;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.*;
import java.util.Vector;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

public class Graph {
    private Vector<GraphNode> nodes;
    private GraphNode start;
    private GraphNode end;

    public Graph() {
        this.nodes = new Vector<>();
        this.start = new GraphNode(null);
        this.end = new GraphNode(null);
    }

    public void updateEdges() {
        for (GraphNode t : nodes)
            t.updateAdjacentEdges();
    }

    public GraphNode getStart() {
        return start;
    }

    public void setStart(String name) {
        Boolean cond = FALSE;
        for (GraphNode t : this.nodes) {
            if (t.getName().equals(name)) {
                this.start = t;
                cond = TRUE;
                break;
            }
        }
        if (!cond) {
            throw new IllegalArgumentException("[!!] Error : Insert name of existing node");
        }
    }

    public GraphNode getEnd() {
        return end;
    }

    public void setEnd(String name) {
        Boolean cond = FALSE;
        for (GraphNode t : this.nodes) {
            if (t.getName().equals(name)) {
                this.end = t;
                cond = TRUE;
                break;
            }
        }
        if (!cond) {
            throw new IllegalArgumentException("[!!] Error : Insert name of existing node");
        }
    }

    public void buildGraph(ServletContext context) {
        String csvFile = "/WEB-INF/graphs/route2.csv";
        BufferedReader br = null;
        String line = "";
        String csvSplitBy = ",";

        try {
            InputStream is = context.getResourceAsStream(csvFile);
            if (is != null) {
                br = new BufferedReader(new InputStreamReader(is));
                line = br.readLine();
                String[] element1 = line.split(csvSplitBy);
                int num_nodes = Integer.parseInt(element1[0]);
                line = br.readLine();
                String[] names = line.split(csvSplitBy);
                for (String x : names) {
                    this.nodes.add(new GraphNode(x));
                }
                for (int j = 0; j < num_nodes; j++) {
                    line = br.readLine();
                    String[] element2 = line.split(csvSplitBy);
                    int num_adj = Integer.parseInt(element2[0]);
                    for (int i = 0; i < num_adj; i++) {
                        line = br.readLine();
                        element2 = line.split(csvSplitBy);
                        String adjacent_name = element2[0];
                        int weight = Integer.parseInt(element2[1]);
                        for (GraphNode y : this.nodes) {
                            if (y.getName().equals(adjacent_name)) {
                                this.nodes.elementAt(j).addAdjacent(new Adjacency(y, weight));
                            }
                        }
                    }
                }
            } else {
                throw new FileNotFoundException("File not found: " + csvFile);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    public String getGraphInfo() {
        StringBuilder graphInfo = new StringBuilder();
        for (GraphNode x : this.nodes) {
            graphInfo.append("Node name:  ").append(x.getName()).append("<br>");
            graphInfo.append("Adjacencies:<br>");
            for (Adjacency t : x.getAdjacents()) {
                graphInfo.append(t.getNode().getName()).append(" with distance: ").append(t.getLength()).append("<br>");
            }
            graphInfo.append("<br>");
        }
        return graphInfo.toString();
    }
}