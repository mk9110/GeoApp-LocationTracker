// Google Apps Script for receiving location data from Android app
// This script should be deployed as a web app

function doPost(e) {
  try {
    // Parse the incoming JSON data
    const data = JSON.parse(e.postData.contents);
    
    // Get the active spreadsheet
    const sheet = SpreadsheetApp.getActiveSheet();
    
    // If this is the first row, add headers
    if (sheet.getLastRow() === 0) {
      sheet.getRange(1, 1, 1, 4).setValues([['Timestamp', 'Latitude', 'Longitude', 'Accuracy']]);
    }
    
    // Add the new location data
    const newRow = [
      data.timestamp,
      data.latitude,
      data.longitude,
      data.accuracy
    ];
    
    sheet.appendRow(newRow);
    
    // Return success response
    return ContentService
      .createTextOutput(JSON.stringify({status: 'success', message: 'Data saved successfully'}))
      .setMimeType(ContentService.MimeType.JSON);
      
  } catch (error) {
    // Return error response
    return ContentService
      .createTextOutput(JSON.stringify({status: 'error', message: error.toString()}))
      .setMimeType(ContentService.MimeType.JSON);
  }
}

function doGet(e) {
  // Handle GET requests (optional)
  return ContentService
    .createTextOutput(JSON.stringify({status: 'ok', message: 'Location tracking service is running'}))
    .setMimeType(ContentService.MimeType.JSON);
}

