import 'package:flutter/material.dart';
import 'details_screen.dart'; 

class AllHeartRateTrends extends StatelessWidget {
  final List<HeartRateEntry> heartRateEntries;

  const AllHeartRateTrends({super.key, required this.heartRateEntries});

  @override
  Widget build(BuildContext context) {
   
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

   
    final bpmFontSize =
        screenWidth * 0.05; 
    final labelFontSize =
        screenWidth * 0.03; 

    return Scaffold(
      appBar: AppBar(
        title: Text("All Heart Rate Trends"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ), 
            child: Text(
              "Heart Rate History",
              style: TextStyle(
                fontSize: screenWidth * 0.06, 
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
          ),
         
          Expanded(
            child: ListView.builder(
              itemCount: heartRateEntries.length,
              itemBuilder: (context, index) {
                final entry = heartRateEntries[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      
                      leading: SizedBox(
                        width:
                            screenWidth *
                            0.15, 
                        height:
                            screenWidth *
                            0.15, 
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFF747A7B), 
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                            children: [
                             
                              Flexible(
                                child: Text(
                                  entry.bpm,
                                  style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        bpmFontSize, 
                                  ),
                                  overflow:
                                      TextOverflow.ellipsis, 
                                  maxLines: 1, 
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.005,
                              ), 
                             
                              Flexible(
                                child: Text(
                                  "bpm",
                                  style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontSize:
                                        labelFontSize, 
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      title: LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            children: [
                             
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      constraints.maxWidth *
                                      0.3,
                                ),
                                child: Chip(
                                  label: Text(
                                    entry.status,
                                    style: TextStyle(color: Colors.white),
                                    overflow:
                                        TextOverflow
                                            .ellipsis,
                                    maxLines: 1, 
                                  ),
                                  backgroundColor: Color(
                                    0XFFA9AAAA,
                                  ), 
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ), 
                              
                              Expanded(
                                child: Text(
                                  entry.activity,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  overflow:
                                      TextOverflow.ellipsis, 
                                  maxLines: 1, 
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      subtitle: Text(
                        entry.timestamp,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                        ), 
                        overflow: TextOverflow.ellipsis, 
                        maxLines: 1, 
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(entry: entry),
                          ),
                        );
                      },
                    ),
                   
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Divider(
                        thickness: 1, 
                        color: Colors.grey[300], 
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class HeartRateEntry {
  final String bpm;
  final String status;
  final String activity;
  final String timestamp;

  HeartRateEntry({
    required this.bpm,
    required this.status,
    required this.activity,
    required this.timestamp,
  });
}
