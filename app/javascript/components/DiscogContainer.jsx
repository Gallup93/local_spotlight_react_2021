import React from "react";
import PropTypes from "prop-types";
import AlbumContainer from "./AlbumContainer"

class DiscogContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = { albums: this.props.albums};
  }
  render () {

    return (
      <div class="discog-container">
        {
          this.state.albums.map((album) => (
            <div onClick={() => this.props.action(album)}>
              < AlbumContainer album={album}/>
            </div>
          ))
        }
      </div>
    );
  }
}

DiscogContainer.propTypes = {
  albums: PropTypes.array
};

export default DiscogContainer;
