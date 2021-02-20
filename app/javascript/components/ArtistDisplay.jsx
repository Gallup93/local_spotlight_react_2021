import React from "react";
import PropTypes from "prop-types";
import ArtistContainer from './ArtistContainer'

class ArtistDisplay extends React.Component {
  render () {

    function artistsList (artists, action) {
      return (
        <div>
          <table>
            <thead>
              <tr>
                <th colspan="3"></th>
              </tr>
            </thead>
            <tbody>
              {
                artists.map((artist) => (
                  <div onClick={() => action(artist)}>
                    < ArtistContainer artist={artist} action={action}/>
                  </div>
                ))
              }
            </tbody>
          </table>
        </div>
      )
    }
    return (
      <div class="index-container">
        {artistsList(this.props.artists, this.props.action)}
      </div>
    )
  }
};

ArtistDisplay.propTypes = {
  artists: PropTypes.array,
  action: PropTypes.func
};

export default ArtistDisplay;
