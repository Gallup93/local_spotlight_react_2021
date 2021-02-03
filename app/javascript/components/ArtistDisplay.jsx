import React from "react";
import PropTypes from "prop-types";

class ArtistDisplay extends React.Component {


  render () {
    function artistsList (artists) {
      return (
        <div>
          <h1>---ARTISTS-DISPLAY-TABLE---</h1>
          <table>
            <thead>
              <tr>
                <th colspan="3"></th>
              </tr>
            </thead>
            <tbody>
              {
                artists.map((artist) => (
                  <div>
                    <td>{artist.city}</td>
                    <td>{artist.state}</td>
                    <td>{artist.spotify_id}</td><br></br>
                  </div>
                ))
              }
            </tbody>
          </table>
        </div>
      )
    }

    return (
      <div class="artists-container">
        {artistsList(this.props.artists)}
      </div>
    )
  }
};


  ArtistDisplay.propTypes = {
    artists: PropTypes.array
  };


export default ArtistDisplay;
